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

variable "azure_subscription_id" {}

variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_tenant_id" {}

variable "azure_rgname" {
  description = "Resource group name"
  default = "qe_resource_group_donotdelete"
}
