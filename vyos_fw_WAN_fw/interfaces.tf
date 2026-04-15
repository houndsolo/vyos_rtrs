resource "vyos_interfaces_ethernet" "lan_trunk" {
  identifier = { ethernet = "eth1" }
  description = "lan trunk"
}

resource "vyos_interfaces_ethernet_vif" "link_to_VyOS_VM_1" {
  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
  identifier = {
    ethernet = "eth1"
    vif = 1111
  }
  description = "link_to_VyOS_VM_1"
}
