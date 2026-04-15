variable "vyos_n100" {
  description = "BM mini pc"
  type = object({
    name       = string
    mgmt_addr  = string
    mgmt_subnet  = string
    node_id    = number
    asn    = number
  })
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
    asn    = number
  }))
}

variable "vyos_n100s" {
  description = "All BM mini pcs"
  type = map(object({
    name       = string
    mgmt_addr  = string
    mgmt_subnet  = string
    node_id    = number
    asn    = number
  }))
}
