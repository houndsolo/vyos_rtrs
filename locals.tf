locals {
  vm_nodes = {
    for k, v in var.vyos_nodes : k => v
    if v.platform == "vm"
  }

  bm_nodes = {
    for k, v in var.vyos_nodes : k => v
    if v.platform == "bm"
  }

}
