variable "vyos_n100s" {
  description = "BM mini pc"
  type = map(object({
    name       = string
    mgmt_addr  = string
    mgmt_subnet  = string
    node_id    = number
  }))
}

variable "vyos_vms" {
  description = "single vm instance"
  type = map(object({
    node_name  = string
    vm_id      = number
    name       = string
    mgmt_addr  = string
    mgmt_subnet  = string
    node_id    = number
  }))
}
