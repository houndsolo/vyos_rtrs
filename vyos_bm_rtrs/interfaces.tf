resource "vyos_interfaces_ethernet" "lan_trunk" {
  identifier = { ethernet = "eth1" }
  description = "lan trunk"
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

resource "vyos_interfaces_ethernet_vif" "link_to_VyOS_VM_1" {
  count = 2
  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
  identifier = {
    ethernet = "eth1"
    vif = 1101 + 10*var.vyos_n100.node_id + count.index
  }
  description = "p2p link to VM routers "
  address = ["10.250.${var.vyos_n100.node_id}${count.index+1}.0/31"]
}
