resource "azurerm_resource_group" "rg" {
    name     = "vm-with-iis-rg"
    location = var.location
}