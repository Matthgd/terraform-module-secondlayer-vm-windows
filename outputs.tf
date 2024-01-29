output "id" {
  value     = module.vm.id
  sensitive = false
  description = "The ID of the Windows Virtual Machine."
}

output "name" {
  value     = module.vm.name
  sensitive = false
  description = "The Name of the Windows Virtual Machine."
}

output "identity" {
  value     = module.vm.identity
  sensitive = true
  description = "An identity block exports the following: principal_id - The ID of the System Managed Service Principal. tenant_id - The ID of the Tenant the System Managed Service Principal is assigned in."
}

output "private_ip_addresses" {
  value     = module.vm.private_ip_addresses[0]
  sensitive = false
  description = "The Primary Private IP Address assigned to this Virtual Machine."
}

output "public_ip_addresses" {
  value     = module.vm.public_ip_addresses
  sensitive = false
  description = "A list of the Public IP Addresses assigned to this Virtual Machine."
}
