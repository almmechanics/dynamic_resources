data "azurerm_resource_group" "dynamic" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "dynamic" {

  resource_group_name      = data.azurerm_resource_group.dynamic.name
  location                 = data.azurerm_resource_group.dynamic.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"

  for_each = toset(distinct(values(var.storage_container_mapping)))
  name     = format("sa%s%03d", var.unique_id, each.key)
}

resource "azurerm_storage_container" "dynamic" {
  depends_on = [
    azurerm_storage_account.dynamic,
  ]

  container_access_type = "private"
  for_each              = var.storage_container_mapping

  storage_account_name = format("sa%s%03d", var.unique_id, each.value)
  name                 = format("%s-%03s", lower(each.key), lower(each.value))
}