output "storage_container_id" {
  value = [values(azurerm_storage_container.dynamic)[*]["id"]]
}



