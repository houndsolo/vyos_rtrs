variable "vyos_vm" {
  description = "single vm instance"
  type = object({
    node_name  = string
    vm_id      = number
    name       = string
    mgmt_addr  = string
    mgmt_subnet  = string
    node_id    = number
  })
}

variable "dns" {
  description = "DNS configuration"
  type = object({
    name_servers = list(string)
    domain_name = string
    domain_search = list(string)
  })
}
