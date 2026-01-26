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

variable "dns" {
  description = "DNS configuration"
  type = object({
    name_servers = list(string)
    domain_name = string
    domain_search = list(string)
  })
  default = {
    name_servers = ["10.8.6.9"]
    domain_name = "lylat.space"
    domain_search = ["lylat.space"]
  }
}


variable "vyos_n100" {
  description = "single vm instance"
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
