resource "vyos_interfaces_ethernet" "lan_trunk" {
  depends_on = [resource.vyos_vrf_name.guest_vrf]
  identifier = { ethernet = "eth1" }
  description = "lan trunk"
}

resource "vyos_interfaces_ethernet_vif" "link_to_VyOS_VM_1" {
  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
  identifier = {
    ethernet = "eth1"
    vif = 1111
  }
  description = "vlan9"
  address = ["10.9.0.${var.vyos_vm.node_id}/16"]
  vrf = "lylat_vrf"
}
