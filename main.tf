module "vyos_vms" {
  for_each = var.vyos_vms
  source   = "./vyos_vms"
  vyos_vm = each.value
  dns     = var.dns
  providers = {
    proxmox = proxmox
    vyos    = vyos.vyos_vms[each.key]
  }
}

module "firewall_groups" {
  source = "./vyos_fw_WAN"
  providers = {
    vyos = vyos.fw-wan
  }
  #interface_groups = var.interface_groups
  #network_groups   = var.network_groups
  #address_groups   = var.address_groups
}

module "n100_vrf_config" {
  for_each = var.vyos_n100
  source = "./vyos_bm_rtrs"
  providers = {
    vyos = vyos.vyos-n100[each.key]
  }
  #interface_config = var.interface_config
}

