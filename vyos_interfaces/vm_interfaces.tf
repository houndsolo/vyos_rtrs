#resource "vyos_interfaces_ethernet" "link_to_BM1" {
#  depends_on = [resource.vyos_vrf_name.guest_vrf]
#  identifier = { ethernet = "eth1" }
#  address = ["10.250.${10 + var.vyos_vm.node_id}.1/31"]
#  description = "link_to_BM1"
#  lifecycle {
#    ignore_changes = [hw_id,offload]
#  }
#}
#
#resource "vyos_interfaces_ethernet" "link_to_BM2" {
#  depends_on = [resource.vyos_vrf_name.guest_vrf]
#  identifier = { ethernet = "eth2" }
#  address = ["10.250.${20 + var.vyos_vm.node_id}.1/31"]
#  description = "link_to_BM2"
#  lifecycle {
#    ignore_changes = [hw_id,offload]
#  }
#}
#
#resource "vyos_interfaces_ethernet" "lan_trunk" {
#  depends_on = [resource.vyos_vrf_name.guest_vrf]
#  identifier = { ethernet = "eth3" }
#  description = "lan trunk"
#  lifecycle {
#    ignore_changes = [hw_id,offload]
#  }
#}
#
#resource "vyos_interfaces_ethernet_vif" "vlan9" {
#  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
#  identifier = {
#    ethernet = "eth3"
#    vif = 9
#  }
#  description = "vlan9"
#  address = ["10.9.0.${var.vyos_vm.node_id}/16"]
#  vrf = "lylat_vrf"
#}
