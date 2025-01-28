resource "azurerm_resource_group" "vm-with-iis-rg" {
    name     = "vm-with-iis-rg"
    location = var.location
}