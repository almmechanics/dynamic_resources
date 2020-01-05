variable "resource_group_name" {
  description = "Resource group to deploy into"
  type        = string
}

variable "storage_mapping" {
  type = map
}
variable "unique_id" {
  type = string
}