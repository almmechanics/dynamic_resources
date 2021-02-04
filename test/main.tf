terraform {
  required_providers {
    local = {
      version = "~> 2.0.0"
    }

    azurerm = {
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features { }
}

resource "random_string" "dynamic" {
  length           = 8
  override_special = "-_"
}

resource "random_string" "unique_id" {
  length  = 10
  special = false
}

resource "azurerm_resource_group" "dynamic" {
  name     = format("rg_test_%s", random_string.dynamic.result)
  location = var.location
}

module "dynamic_example" {
  source                    = "../"
  resource_group_name       = azurerm_resource_group.dynamic.name
  storage_container_mapping = var.storage_container_mapping
  unique_id                 = lower(random_string.unique_id.result)
}