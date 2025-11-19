```markdown
# AWESOME Azure Bicep 💪 with CLI (Beginner friendly)

This short guide helps new developers and students get started using Azure CLI together with Bicep files. It covers the minimum requirements, how to check/update the CLI, how to install the Bicep tooling, and the most common commands and workflows you'll use while developing and deploying Bicep templates.

---

## Who this is for
- New developers learning Infrastructure as Code with Bicep
- Students working on Azure projects or labs
- Anyone who wants a quick, practical CLI-based workflow for Bicep

---

## Prerequisites
- An Azure subscription (you can create a free one at https://azure.microsoft.com/free/)
- Azure CLI version 2.20.0 or later (required for the integrated Bicep support)
- A terminal (PowerShell, Bash, macOS Terminal, Windows Terminal, etc.)

Official install docs:
- Install Azure CLI on Windows: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
- Install Azure CLI on Linux: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
- Install Azure CLI on macOS: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos

Helpful article on checking/updating CLI:
- How to check and update Azure CLI version on your workstation: https://thecloudmarathoner.com/index.php/2021/09/02/how-to-check-and-update-azure-cli-verison-on-your-workstation/

---

## Check your Azure CLI version
Run:
```bash
az --version
```
Look for the top-line version (e.g., `azure-cli 2.XX.X`). If it is older than 2.20.0, update the CLI (see install docs above).

A quick way to upgrade the CLI (if supported on your platform):
```bash
az upgrade
```
Note: On some systems you should use your package manager (brew, apt, choco, etc.). Refer to the platform-specific docs linked above.

---

## Install (or verify) the Bicep CLI
Modern Azure CLI includes Bicep commands. To make sure the Bicep CLI is installed and up-to-date, run:
```bash
az bicep install
az bicep version
```
You can also use the standalone Bicep CLI:
```bash
bicep --version
bicep build ./main.bicep   # build to ARM JSON (optional)
```

---

## Quick, common workflow (examples)
1. Sign in to Azure:
```bash
az login
```
If you have multiple subscriptions, set the one you want to use:
```bash
az account set --subscription "My Subscription Name or ID"
```

2. Create a resource group (example):
```bash
az group create --name myResourceGroup --location eastus
```

3. Build a Bicep file to ARM JSON (optional — you can deploy Bicep directly too):
```bash
az bicep build --file ./main.bicep
# produces main.json
```

4. Deploy a Bicep file to a resource group:
```bash
az deployment group create \
  --resource-group myResourceGroup \
  --template-file ./main.bicep \
  --parameters location=eastus tags='{"owner":"student"}'
```

5. Deploy at subscription scope (for resources like role assignments, management groups, etc.):
```bash
az deployment sub create \
  --location eastus \
  --template-file ./subscription.bicep
```

Notes:
- You can pass parameters inline (see `--parameters`) or from a parameters file.
- The `--template-file` can accept a `.bicep` file directly — no manual build step required.

---

## Helpful commands while developing
- Lint and decompile:
```bash
az bicep build --file ./main.bicep      # converts to ARM template (JSON)
az bicep decompile ./main.json         # converts JSON back to Bicep (best-effort)
```
- Validate a deployment without applying:
```bash
az deployment group validate \
  --resource-group myResourceGroup \
  --template-file ./main.bicep
```
- View recent deployments:
```bash
az deployment group list --resource-group myResourceGroup
```

---

## Troubleshooting tips
- Error: "Not logged in" — run `az login` and make sure your account has the proper subscription/permissions.
- Error: "Resource group not found" — create it first with `az group create`.
- Permission errors when deploying — check your role (e.g., Contributor) on the target subscription/resource group.
- If `az bicep` subcommands are missing, update Azure CLI or run `az bicep install`.

---

## Next steps and learning resources
- Bicep official docs: https://learn.microsoft.com/azure/azure-resource-manager/bicep/
- Azure CLI reference: https://learn.microsoft.com/cli/azure/
- Try building a small example: create a VM or storage account with a simple `main.bicep` and deploy it to your test resource group.

---

Keep this guide handy while you practice. Start small, iterate on your Bicep files, and use `az deployment ... validate` to catch issues before applying changes.
```