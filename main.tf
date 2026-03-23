module "vyos_vms" {
  for_each = var.vyos_vms
  source   = "./vyos_vms"
  vyos_vm = each.value
  vyos_vms = var.vyos_vms
  dns     = var.dns
  providers = {
    proxmox = proxmox
    vyos    = vyos.vyos_vms[each.key]
  }
}

#module "firewall_groups" {
#  source = "./vyos_fw_WAN"
#  providers = {
#    vyos = vyos.fw-wan
#  }
#  #  interface_groups = var.interface_groups
#  #  interface_includes = var.interface_includes
#  #  network_groups   = var.network_groups
#  #  network_includes = var.network_includes
#  #  address_groups   = var.address_groups
#  #  address_includes = var.address_includes
#}

module "n100_vrf_config" {
  for_each = var.vyos_n100s
  vyos_n100 = each.value
  vyos_vms = var.vyos_vms
  vyos_n100s = var.vyos_n100s
  source = "./vyos_bm_rtrs"
  providers = {
    vyos = vyos.vyos-n100s[each.key]
  }
  #interface_config = var.interface_config
}
