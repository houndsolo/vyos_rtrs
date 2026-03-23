provider "proxmox" {
  endpoint = "https://10.2.0.10:8006"
  api_token = var.pve_api_token
  insecure = true

  ssh {
    username    = "root"
    private_key = file("~/.ssh/id_rsa")
  }
}

provider "vyos" {
  for_each = var.vyos_vms
  alias = "vyos_vms"

  endpoint = "https://${each.value.mgmt_addr}"
  api_key  = var.vyos_key

  certificate = { disable_verify = true }
  default_timeouts = 2
  overwrite_existing_resources_on_create = true
}


#provider "vyos" {
#  alias = "fw-wan"
#  endpoint ="https://10.20.10.255"
#  api_key  = var.vyos_key
#  certificate = {
#    disable_verify = true
#  }
#  default_timeouts = 2
#  overwrite_existing_resources_on_create = true
#}

provider "vyos" {
  alias = "vyos-guest"
  endpoint ="https://10.20.10.105"
  api_key  = var.vyos_key
  certificate = {
    disable_verify = true
  }
  default_timeouts = 2
  overwrite_existing_resources_on_create = true
}

provider "vyos" {
  for_each = var.vyos_n100s
  alias = "vyos-n100s"
  endpoint = "https://${each.value.mgmt_addr}"
  api_key  = var.vyos_key
  certificate = {
    disable_verify = true
  }
  default_timeouts = 2
  overwrite_existing_resources_on_create = true
}

