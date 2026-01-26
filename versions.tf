terraform {
  required_providers {
    proxmox = {
      source = "local/houndsolo/proxmox"
      version = "0.89.1"
    }
    vyos = {
      source = "registry.terraform.io/echowings/vyos-rolling"
      version = "0.17.202507150"
    }
  }
}
