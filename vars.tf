variable "resource_group_name" {
  description = "Resource group for the azure deployment"
  type        = string
}

variable "storage_container_mapping" {
  description = "Mapping of Storage containers to Storage accounts"
  type        = map
}

variable "unique_id" {
  description = "Unique string ID for the storage account"

  type = string
}