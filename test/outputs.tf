output "resource_group_name" {
  value = azurerm_resource_group.dynamic.name
}

output "storage_containers" {
  value = module.dynamic_example.storage_container_id
}