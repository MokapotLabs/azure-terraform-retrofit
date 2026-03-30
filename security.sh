#!/usr/bin/env bash
set -euo pipefail

if ! command -v az >/dev/null 2>&1; then
  echo "Azure CLI is required." >&2
  exit 1
fi

require_var() {
  local name="$1"
  if [[ -z "${!name:-}" ]]; then
    echo "Missing required environment variable: ${name}" >&2
    exit 1
  fi
}

require_var "TENANT_ID"
require_var "SUBSCRIPTION_ID"
require_var "GITHUB_OWNER"
require_var "GITHUB_REPO"

APP_NAME="${APP_NAME:-gh-${GITHUB_REPO}}"

az login >/dev/null
az account set --subscription "${SUBSCRIPTION_ID}"

CLIENT_ID="$(
  az ad app create \
    --display-name "${APP_NAME}" \
    --query appId \
    -o tsv
)"

APP_OBJECT_ID="$(
  az ad app show \
    --id "${CLIENT_ID}" \
    --query id \
    -o tsv
)"

az ad sp create --id "${CLIENT_ID}" >/dev/null
sleep 15

SP_OBJECT_ID="$(
  az ad sp show \
    --id "${CLIENT_ID}" \
    --query id \
    -o tsv
)"

az role assignment create \
  --assignee-object-id "${SP_OBJECT_ID}" \
  --assignee-principal-type ServicePrincipal \
  --role Contributor \
  --scope "/subscriptions/${SUBSCRIPTION_ID}" >/dev/null

if [[ -n "${TFSTATE_RESOURCE_GROUP:-}" && -n "${TFSTATE_STORAGE_ACCOUNT:-}" ]]; then
  az role assignment create \
    --assignee-object-id "${SP_OBJECT_ID}" \
    --assignee-principal-type ServicePrincipal \
    --role "Storage Blob Data Contributor" \
    --scope "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${TFSTATE_RESOURCE_GROUP}/providers/Microsoft.Storage/storageAccounts/${TFSTATE_STORAGE_ACCOUNT}" >/dev/null
fi

write_fic() {
  local name="$1"
  local subject="$2"
  local description="$3"
  local file
  file="$(mktemp)"

  cat > "${file}" <<EOF
{
  "name": "${name}",
  "issuer": "https://token.actions.githubusercontent.com",
  "subject": "${subject}",
  "description": "${description}",
  "audiences": ["api://AzureADTokenExchange"]
}
EOF

  if az ad app federated-credential list --id "${APP_OBJECT_ID}" --query "[?name=='${name}'].id | [0]" -o tsv | grep -q .; then
    local fic_id
    fic_id="$(az ad app federated-credential list --id "${APP_OBJECT_ID}" --query "[?name=='${name}'].id | [0]" -o tsv)"
    az ad app federated-credential update \
      --id "${APP_OBJECT_ID}" \
      --federated-credential-id "${fic_id}" \
      --parameters @"${file}" >/dev/null
  else
    az ad app federated-credential create \
      --id "${APP_OBJECT_ID}" \
      --parameters @"${file}" >/dev/null
  fi

  rm -f "${file}"
}

write_fic \
  "github-pr" \
  "repo:${GITHUB_OWNER}/${GITHUB_REPO}:pull_request" \
  "GitHub Actions pull_request plans for ${GITHUB_REPO}"

write_fic \
  "github-dev-env" \
  "repo:${GITHUB_OWNER}/${GITHUB_REPO}:environment:dev" \
  "GitHub Actions dev environment applies for ${GITHUB_REPO}"

write_fic \
  "github-prod-env" \
  "repo:${GITHUB_OWNER}/${GITHUB_REPO}:environment:prod" \
  "GitHub Actions prod environment applies for ${GITHUB_REPO}"

cat <<EOF

GitHub repository variables:
AZURE_CLIENT_ID=${CLIENT_ID}
AZURE_TENANT_ID=${TENANT_ID}
AZURE_SUBSCRIPTION_ID=${SUBSCRIPTION_ID}

If you rename the GitHub repository, rerun this script or update the federated credentials in Azure.
Current trusted subjects:
- repo:${GITHUB_OWNER}/${GITHUB_REPO}:pull_request
- repo:${GITHUB_OWNER}/${GITHUB_REPO}:environment:dev
- repo:${GITHUB_OWNER}/${GITHUB_REPO}:environment:prod
EOF
