.ONESHELL: 

bootstrap: 
			set -e 
			terraform init
			terraform apply -target=azurerm_resource_group.this_resource_group --auto-approve &&
			sleep 2m 
			terraform apply -target=module.storage.azurerm_storage_account.this_storage_account --auto-approve &&
			terraform apply -target=module.storage.azurerm_storage_container.this_storage_container --auto-approve &&
			sleep 1m &&
			terraform apply -target=module.storage.azurerm_storage_blob.example --auto-approve &&
			echo "Boostrapping Complete"