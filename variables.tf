variable "name" {
  description = "Resource VM name"
  type        = string
}

variable "location" {
  description = "Location info and alias to resources deploy"
  type = string
}

variable "admin_username" {
  type        = string
  description = " (Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
}


variable "admin_password" {
  type        = string
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Windows Virtual Machine should be exist. Changing this forces a new resource to be created."
}

variable "size" {
  type        = string
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  default     = "Standard_B2s"
}

variable "caching" {
  type        = string
  description = "(Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable "storage_account_type" {
  type        = string
  description = "(Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
  default     = "Standard_LRS"
}

variable "source_image_reference_enabled" {
  type        = bool
  description = " "
  default     = true
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "(Required). A "
}

variable "ip_configurations" {
  type = list(object({
    name                          = string
    subnet_id                     = string
    private_ip_address_allocation = string
  }))
  description = "(Required) ip settings block  "
}

variable "allow_extension_operations" {
  type = bool
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine?"
  default = true
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "(Optional) Should Accelerated Networking be enabled? Defaults to false."
  default     = false
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
}