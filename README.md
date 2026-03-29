# Azure Terraform 

This repository is the Terraform + GitHub Actions answer to the brief:

- build a **reusable Azure VNet module**
- deploy **multiple Azure environments** using that module
- add a couple of practical resources beyond networking
- show a reasonable **GitHub-based CI/CD flow**

The brief and hints point toward reusable code, secure defaults, clear naming, useful outputs, and a defensible approach to environment separation. This repository addresses those expectations in the simplest review-friendly way:

- a reusable local VNet module under `modules/vnet/`
- one plain Terraform root that deploys `dev` and `prod`
- environment differences driven by Terraform CLI workspaces instead of duplicated roots
- Azure + GitHub OIDC auth
- Azure Blob remote state
- a GitHub Actions workflow for validation, planning, and controlled deployment

Each workspace provisions:

- one resource group
- one VNet built from the reusable local module
- one Linux VM
- one Storage Account plus a private Blob container

## Engineering choices:

- reusable module design
- environment-aware naming and tagging
- remote state in Azure
- GitHub OIDC instead of long-lived cloud secrets
- a practical PR/plan/apply lifecycle
- no HCP Terraform runtime dependency
- no private module registry dependency
- no paid orchestration layer
- no component or Stack abstraction

## Related Repos

This repo sits alongside three related repositories that resolve the same brief using more 
advanced variants:

- VNet module repo: [MokapotLabs/terraform_iac_vnet](https://github.com/MokapotLabs/terraform_iac_vnet)
- HCP-published component variant: [MokapotLabs/azure-terraform-example](https://github.com/MokapotLabs/azure-terraform-example)
- HCP consumer Stack variant: [MokapotLabs/azure-terraform-consumer](https://github.com/MokapotLabs/azure-terraform-consumer)

Those repositories show how a more advanced Terraform Cloud setup would be, using the [brand new Stacks feature]
(https://www.hashicorp.com/en/blog/terraform-stacks-explained). Compared with the Stack-based version:

- it remains self-contained
- it keeps Azure + GitHub OIDC
- it keeps Azure Blob remote state
- it avoids HCP runtime dependencies

Tradeoffs:

- no HCP orchestration layer
- no Stack/component model
- no HCP UI for staged deployments
- no HCP deployment metadata or policy layer
- and more

The Azure Blob backend still gives you remote state and locking/consistency protection.

## Architecture

- one root Terraform configuration at repo root
- one vendored reusable VNet module under `modules/vnet/`
- one Azure Blob `azurerm` backend configured manually outside Terraform
- one GitHub Actions workflow that runs plain Terraform against the `dev` and `prod` CLI workspaces

## Repository Layout

```text
.
├── .github/workflows/terraform.yml
├── .pre-commit-config.yaml
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
└── modules/vnet/
```

## Workspace Model

This repo supports exactly two Terraform CLI workspaces:

- `dev`
- `prod`

The `default` workspace is intentionally rejected.

Environment-specific settings are selected from a single locals map keyed by `terraform.workspace`:

- `dev`
  - location: `eastus2`
  - location_short: `eus2`
  - public IP enabled
- `prod`
  - location: `westeurope`
  - location_short: `weu`
  - no public IP

## Terraform "apply" and "destroy" logs

Please see the [terraform apply log](APPLY-LOG.md) and the [terraform destroy log](DESTROY-LOG.md) logs for reference.

## Backend Prerequisite

This repo does **not** create its own backend storage account. The backend is assumed to be created and governed separately.

Manual example using Azure CLI:

```bash
az group create \
  --name rg-acme-tfstate \
  --location eastus2

az storage account create \
  --name <globally-unique-storage-account> \
  --resource-group rg-acme-tfstate \
  --location eastus2 \
  --sku Standard_LRS \
  --kind StorageV2 \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false \
  --allow-shared-key-access false

az storage container create \
  --name tfstate \
  --account-name <globally-unique-storage-account> \
  --auth-mode login
```

Required Azure access for the GitHub OIDC principal:

- `Contributor` on the target subscription or target resource groups
- `Storage Blob Data Contributor` on the backend container or storage account
- `Reader` on the backend storage account only if `lookup_blob_endpoint` is ever needed

## Local Usage

For local development with Azure CLI authentication:

```bash
az login
export ARM_USE_CLI=true
export ARM_USE_AZUREAD=true

terraform init \
  -backend-config="resource_group_name=<tfstate-rg>" \
  -backend-config="storage_account_name=<tfstate-sa>" \
  -backend-config="container_name=<tfstate-container>" \
  -backend-config="key=terraform.tfstate"

terraform workspace select dev || terraform workspace new dev
terraform plan -var="admin_ssh_public_key=$(cat ~/.ssh/id_rsa.pub)"
```

Repeat with `prod` for the production workspace.

## Destroying An Environment

Destroy uses the same backend and the same Terraform workspace that was used to create the environment.

If you are destroying locally with Azure CLI authentication, ensure your signed-in user has `Storage Blob Data Contributor` on the backend storage account so Terraform can access workspace state.

Initialize the backend first:

```bash
az login
export ARM_USE_CLI=true
export ARM_USE_AZUREAD=true

terraform init \
  -backend-config="resource_group_name=rg-acme-tfstate" \
  -backend-config="storage_account_name=stacmetfstatefed12f" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=terraform.tfstate"
```

Destroy `dev`:

```bash
terraform workspace select dev
terraform destroy \
  -var='admin_ssh_public_key=<your-ssh-public-key>' \
  -var='dev_admin_cidrs=["<your-current-public-ip>/32"]' \
  -var='prod_admin_cidrs=[]'
```

Destroy `prod`:

```bash
terraform workspace select prod
terraform destroy \
  -var='admin_ssh_public_key=<your-ssh-public-key>' \
  -var='dev_admin_cidrs=["<your-current-public-ip>/32"]' \
  -var='prod_admin_cidrs=[]'
```

Use the same SSH key and admin CIDR values that were configured for the original deployment.

Optional cleanup after both environments are destroyed:

```bash
terraform workspace select default
terraform workspace delete dev
terraform workspace delete prod
```

Delete the backend resource group only after all workspaces are destroyed if you want to remove the shared state infrastructure too.

## GitHub Actions Configuration

Repository variables expected by the workflow:

- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- `TFSTATE_RESOURCE_GROUP`
- `TFSTATE_STORAGE_ACCOUNT`
- `TFSTATE_CONTAINER`
- `TF_DEV_ADMIN_CIDRS`
  - example: `["203.0.113.10/32"]`
- `TF_PROD_ADMIN_CIDRS`
  - example: `[]`

Repository secrets expected by the workflow:

- `TF_ADMIN_SSH_PUBLIC_KEY`

GitHub environments:

- `dev` for the automatic development apply
- `prod` as a protected environment for the manual production promotion

## Release Lifecycle

The workflow keeps the original lightweight release flow:

1. Pull requests run `fmt`, `tflint`, docs drift check, validation, and plans for `dev` and `prod`.
2. A merge to `main` automatically applies `dev`.
3. `prod` is applied manually with `workflow_dispatch`.

## Local Pre-Commit Checks

Install and enable pre-commit:

```bash
pip install pre-commit
pre-commit install
```

The configured hooks run:

- `terraform fmt -check -recursive`
- `tflint --recursive` with `TF_WORKSPACE=dev`
- `terraform validate` for the `dev` workspace
- `terraform validate` for the `prod` workspace

The root intentionally does not support the Terraform `default` workspace.

## Security Notes

- the VNet module supports subnet-specific NSGs and optional service delegation
- the `dev` VM is reachable only from the configured admin CIDRs
- the `prod` VM has no public IP by default
- blob public access is disabled
- storage account TLS minimum is enforced
- backend auth is intended to use Microsoft Entra ID, not SAS or shared keys

## Module Documentation

Refresh the vendored module docs with:

```bash
terraform-docs markdown table --config .terraform-docs.yml modules/vnet
```
