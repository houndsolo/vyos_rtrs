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
