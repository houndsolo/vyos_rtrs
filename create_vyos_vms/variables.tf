variable "node" {
  type = object({
    name        = string
    mgmt_addr   = string
    mgmt_subnet = string
    node_id     = number
    asn         = number

    platform    = string
    hypervisor_node   = optional(string)
    hypervisor_vm_id       = optional(number)
  })

  validation {
    condition     = contains(["vm", "bm"], var.node.platform)
    error_message = "platform must be either \"vm\" or \"bm\"."
  }
}


variable "nodes" {
  description = "All VyOS nodes"
  type = map(object({
    name        = string
    mgmt_addr   = string
    mgmt_subnet = string
    node_id     = number
    asn         = number

    platform    = string
    hypervisor_node   = optional(string)
    hypervisor_vm_id       = optional(number)
  }))

  validation {
    condition = alltrue([
      for n in values(var.nodes) : contains(["vm", "bm"], n.platform)
    ])
    error_message = "Each vyos_nodes entry must have platform set to either \"vm\" or \"bm\"."
  }
}

variable "dns" {
  description = "DNS configuration"
  type = object({
    name_servers  = list(string)
    domain_name   = string
    domain_search = list(string)
  })
}
