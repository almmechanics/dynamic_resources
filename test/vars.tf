variable "location" {
  description = "Region for the azure deployment"
  type        = string
}

variable "storage_container_mapping" {
  description = "Mapping of Storage containers to Storage accounts"
  type        = map
}