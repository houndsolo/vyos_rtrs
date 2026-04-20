resource "vyos_interfaces_ethernet" "lan_trunk" {
  identifier = { ethernet = "eth3" }
  description = "lan trunk"
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

resource "vyos_interfaces_ethernet" "link_to_VyOS_BM" {
  depends_on = [resource.vyos_interfaces_ethernet.lan_trunk]
  for_each = {
    for k, v in var.nodes : k => v
    if v.platform == "bm"
  }

  identifier = { ethernet = "eth${each.value.node_id}" }
  description = "link_to_VyOS_BM_${each.value.node_id}"
  address = ["10.250.${each.value.node_id}.0/31"]
  lifecycle {
    ignore_changes = [hw_id,offload]
  }
}

