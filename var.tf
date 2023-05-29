variable "prefix" {
  description = "The prefix which should be used for all resources"
  default = "cpg-test"
}

variable "location" {
  description = "The Azure Region in which all resources are created"
}

variable "VMSize" {
  default = "Standard_H8m"
}

variable "azure_subscription_id" {
  default = "061b9311-9c54-4471-9a59-4909517d6f07"
}

variable "azure_client_id" {
  default = "9d5dac73-c247-4f6e-93b7-c6f0f8f3eb13"
}

variable "azure_client_secret" {
  default = "~Zg8Q~8Byz5G0YackT_wxmWJTFxEqr26YWuRdb_C"
}

variable "azure_tenant_id" {
  default = "8bcff170-9979-491e-8683-d8ced0850bad"
}

variable "azure_rgname" {
  description = "Resource group name"
  default = "qe_resource_group_donotdelete"
}
