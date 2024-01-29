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

module "ansible" {
  depends_on = [
    module.vm
  ]
  source               = "https://github.com/Matthgd/terraform-module-azurerm-vm-extension.git"
  name                 = "ansible"
  virtual_machine_id   = module.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings = jsonencode({
    fileUris : ["https://raw.githubusercontent.com/ansible/ansible-documentation/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"]
    commandToExecute = "powershell -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
  })

}