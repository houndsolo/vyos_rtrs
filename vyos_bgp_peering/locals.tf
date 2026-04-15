locals {
  vm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "vm"
  }

  bm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "bm"
  }

  bgp_neighbors = lower(var.node.platform) == "bm" ? {
  for vm_key, vm in local.vm_nodes : vm_key => {
    neighbor_ip = "10.250.${var.node.node_id}${vm.node_id}.1"
    remote_as   = vm.asn
    description = "underlay to ${vm_key}"
  }
} : lower(var.node.platform) == "vm" ? {
  for bm_key, bm in local.bm_nodes : bm_key => {
    neighbor_ip = "10.250.${bm.node_id}${var.node.node_id}.0"
    remote_as   = bm.asn
    description = "underlay to ${bm_key}"
  }
} : {}
}
