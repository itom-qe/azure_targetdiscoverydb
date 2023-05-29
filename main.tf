provider "azurerm" {
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  features {}
}

resource "azurerm_resource_group" "rg" {
    name                  = var.azure_rgname
    location              = var.location
}

resource "azurerm_mssql_server" "example" {
  name                         = "${var.prefix}-sqlsvr${random_id.id.hex}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${azurerm_resource_group.rg.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd!"

}

resource "azurerm_mssql_database" "example" {
  name                             = "${var.prefix}-db"
  #resource_group_name              = "${azurerm_resource_group.rg.name}"
  #location                         = "${azurerm_resource_group.rg.location}"
  #server_name                      = "${azurerm_mssql_server.example.name}"
  server_id                         = "${azurerm_mssql_server.example.id}"
  #edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

  tags = {
    foo = "bar"
  }
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_mssql_firewall_rule" "example" {
  name                = "allow-azure-services"
  #resource_group_name = "${azurerm_resource_group.rg.name}"
  #server_name         = "${azurerm_mssql_server.example.name}"
  server_id           = "${azurerm_mssql_server.example.id}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}



resource "random_id" "id" {
  byte_length = 2
}
