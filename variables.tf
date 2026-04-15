variable "vyos_nodes" {
  description = "All VyOS nodes"

  type = map(object({
    name              = string
    mgmt_addr         = string
    mgmt_subnet       = string
    node_id           = number
    asn               = number
    platform          = string
    hypervisor_node   = optional(string)
    hypervisor_vm_id  = optional(number)
  }))

  validation {
    condition = alltrue([
      for n in values(var.vyos_nodes) : contains(["vm", "bm"], n.platform)
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

variable "interface_groups" {
  type = map(object({
    description = optional(string)
    interfaces  = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "interface_includes" {
  type = map(object({
    description = optional(string)
    interfaces  = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "network_groups" {
  type = map(object({
    description = optional(string)
    networks    = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "network_includes" {
  type = map(object({
    description = optional(string)
    interfaces  = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "address_groups" {
  type = map(object({
    description = optional(string)
    address     = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "address_includes" {
  type = map(object({
    description = optional(string)
    interfaces  = optional(list(string), [])
    includes    = optional(list(string), [])
  }))
  default = {}
}

variable "proxmox_node_ids" {
  description = "Proxmox node IDs keyed by node name."
  type = map(object({
    id        = number
    cpu_cores = number
  }))
  default = {}
}
