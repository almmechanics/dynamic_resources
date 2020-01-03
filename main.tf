data "azurerm_resource_group" "dynamic" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "dynamic" {

  resource_group_name      = data.azurerm_resource_group.dynamic.name
  location                 = data.azurerm_resource_group.dynamic.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"

  count = length(distinct(var.storage_mapping[*].sa))
  name  = format("sa%s%03d", var.unique_id, count.index)
}

resource "azurerm_storage_container" "dynamic" {

  container_access_type = "private"
  count                 = length(var.storage_mapping[*].sa)

  storage_account_name = format("sa%s%03d", var.unique_id, var.storage_mapping[count.index].sa)
  name                 = format("cont%s-%s", var.unique_id, lower(var.storage_mapping[count.index].name))
}