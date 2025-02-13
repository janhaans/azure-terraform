# Terraform provider for Azure
variable "subscription_id" {
  description = "The Azure subscription ID"
  type = string
} 
variable "client_id" {
  description = "The Azure client ID"
  type = string
}
variable "client_secret" {
  description = "The Azure client secret"
  type = string
  sensitive = true
}
variable "tenant_id" {
  description = "The Azure tenant ID"
  type = string
}

# Azure region where resources will be created
variable "location" {
  description = "The Azure region where resources will be created"
  type = string
}

# Resource group
variable "rg_name" {
  description = "The name of the resource group"
  type = string
}

# Virtual network
variable vnet_name {
  description = "The name of the virtual network"
  type = string
}
variable "vnet_address_space" {
  description = "The address space that is used the virtual network"
  type = list(string)
}

# Subnet
variable "subnet_name" {
  description = "The name of the subnet"
  type = string
}
variable "subnet_address_prefix" {
  description = "The address prefix that is used the subnet"
  type = list(string)
}

# VM
variable "vm_name" {
  description = "The name of the virtual machine"
  type = string
}