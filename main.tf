module "nic" {
  source                        = "https://github.com/Matthgd/terraform-module-azurerm-network-interface.git"
  location                      = var.location
  name                          = "${var.name}-nic"
  resource_group_name           = var.resource_group_name
  ip_configurations             = var.ip_configurations
  enable_accelerated_networking = var.enable_accelerated_networking
}

module "vm" {
  source                = "https://github.com/Matthgd/terraform-module-azurerm-vm-windows.git"
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [module.nic.id]

  caching              = var.caching
  storage_account_type = var.storage_account_type

  source_image_reference         = var.source_image_reference
  source_image_reference_enabled = var.source_image_reference_enabled

  identity = {
    type = "SystemAssigned"
  }
  allow_extension_operations = var.allow_extension_operations

  tags = var.tags
}