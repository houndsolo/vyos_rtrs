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

