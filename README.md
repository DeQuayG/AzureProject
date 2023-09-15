# AzureProject
- Added a script in the Makefile that will set up the     prerequsite resources needed for a deployment. It will deploy the resource group, storage account, and storage container. After which you can uncomment out the blob backend and do a regular terraform work flow

## To DO: 
- Create a Makefile script that terraform init's and apply-target's
  the backend blob and resource group. If it's targeted maybe it will solve the chicken and egg issues with starting a remote backend deployment