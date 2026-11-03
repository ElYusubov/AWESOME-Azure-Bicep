# Bicep learning lab

This folder contains a simple, beginner-friendly progression for learning Azure Bicep by doing.

## Recommended order

1. [01-storage-account](./01-storage-account) - deploy your first Azure Storage account
2. [02-storage-account-tags](./02-storage-account-tags) - add tags and environment-based values
3. [03-storage-account-with-container](./03-storage-account-with-container) - create a storage account and blob container
4. [04-webapp-with-storage-module](./04-webapp-with-storage-module) - create a web app and reuse a storage module to teach Bicep modularity

## How to use this lab

- Start with step 1 and complete it before moving to step 2.
- Use the included parameter files and deployment scripts to practice the workflow.
- After each step, review the template and ask: what changed, why did it change, and what did the deployment produce?

## What you will learn

- Bicep syntax basics
- Parameters and parameter files
- Variables and outputs
- Resource declarations and nested resources
- Modules and reusable deployment logic
- Common deployment commands with Azure CLI and PowerShell

## Suggested learning approach

- Read the sample README in each folder.
- Deploy the template to a resource group.
- Change one small thing in the template and redeploy it.
- Review the output and understand what the resource is doing.

## Hands-on goal

By the end of this lab, you should feel comfortable reading a basic Bicep file and deploying a minimal Azure resource with confidence.
