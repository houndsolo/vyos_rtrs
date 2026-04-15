locals {
  vm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "vm"
  }

  bm_nodes = {
    for k, v in var.nodes : k => v
    if v.platform == "bm"
  }

  bm_vm_links = {
    for vm_key, vm in local.vm_nodes :
    "${var.node.name}-${vm_key}" => {
      vm_key      = vm_key
      vm          = vm
      ethernet    = "eth1"
      vif         = 1100 + (10 * var.node.node_id) + vm.node_id
      bm_address  = "10.250.${var.node.node_id}${vm.node_id}.0/31"
      vm_address  = "10.250.${var.node.node_id}${vm.node_id}.1/31"
      description = "p2p link ${var.node.name} to ${vm_key}"
    }
  }
}
