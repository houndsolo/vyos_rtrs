resource "vyos_interfaces_ethernet" "link_VyOS_BM_to_FW_WAN" {
  for_each = var.node.platform == "bm" ? { (var.node.name) = var.node } : {} # only for bm

  identifier = { ethernet = "eth3" }
  description = "p2p link to vyos FW-WAN"
  address = ["10.250.${var.node.node_id}.1/31"]
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

resource "vyos_interfaces_ethernet_vif" "link_VyOS_BM_to_VM" {
  for_each = var.node.platform == "bm" ? local.vm_nodes : {} # only for bm, and one vif per vm


  identifier = {
    ethernet = "eth1"
    vif      = 1100 + (10 * var.node.node_id) + each.value.node_id # 1100 + 10xBM + VM
  }

  description = "p2p link to ${each.key}"
  address     = ["10.250.${var.node.node_id}${each.value.node_id}.0/31"]
}


resource "vyos_interfaces_ethernet" "link_VyOS_VM_to_BM" {
  for_each = var.node.platform == "vm" ? local.bm_nodes : {} # only for vm, and one interface per bm

  identifier = { ethernet = "eth${each.value.node_id}" }
  address = ["10.250.${each.value.node_id}${var.node.node_id}.1/31"]
  description = "link_to_BM${each.value.node_id}"
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

resource "vyos_interfaces_ethernet" "lan_trunk" {
  for_each = var.node.platform == "vm" ? { (var.node.name) = var.node } : {} # only for vm
  identifier = { ethernet = "eth3" }
  description = "lan trunk"
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

resource "vyos_interfaces_ethernet_vif" "vlan9" {
  for_each = var.node.platform == "vm" ? { (var.node.name) = var.node } : {} # only for vm
  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
  identifier = {
    ethernet = "eth3"
    vif = 9
  }
  description = "vrrp-vlan9"
  address = ["10.9.0.${var.node.node_id}/16"]
  vrf = "lylat_lan"
}
