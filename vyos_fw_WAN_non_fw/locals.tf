locals {
  vm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "vm"
  }

  bm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "bm"
  }
  # creates BM neighbors
  bgp_neighbors = {
    for bm_key, bm in local.bm_nodes : bm_key => {
      neighbor_ip = "10.250.${bm.node_id}.1"
      remote_as   = bm.asn
      description = "underlay to ${bm_key}"
    }
  }
}

