# set hostname since some initialization options aren't used with user_data_file_id set
resource "vyos_system" "vyos_rtr_initial_config" {
  depends_on = [resource.proxmox_virtual_environment_vm.vyos_rtr_vms]
  host_name = resource.proxmox_virtual_environment_vm.vyos_rtr_vms.name
  domain_name = var.dns.domain_name
  domain_search = var.dns.domain_search
  name_server = var.dns.name_servers
  #time_zone = local.time_zone
}
