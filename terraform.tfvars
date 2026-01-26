proxmox_node_ids = {
  fichina = {
    id    = 10
    cpu_cores = 16
  }
  fortuna = {
    id    = 11
    cpu_cores = 16
  }
  macbeth = {
    id    = 12
    cpu_cores = 24
  }
  titania = {
    id    = 13
    cpu_cores = 16
  }
  zoness = {
    id    = 14
    cpu_cores = 24
  }
  venom = {
    id    = 17
    cpu_cores = 32
  }
  eldarad = {
    id    = 21
    cpu_cores = 32
  }
}

interface_groups = {
  WAN = {
    description = "Internet-facing"
    interfaces  = ["eth5"]
  }
  LAN-TRUSTED = {
    interfaces = ["eth1", "eth2", "eth3"]
  }
  LAN-UNTRUSTED = {
    interfaces = ["eth4"]
  }

  MGMT = {
    interfaces = ["eth0"]
  }
}
interface_includes = {
  LAN = {
    description = "Inside"
    includes    = ["LAN-TRUSTED", "LAN-UNTRUSTED"]
  }
}

network_groups = {
     RFC1122 = {
         description = "Carrier Grade NAT"
         networks = ["100.64.0.0/10", "240.0.0.0/4"]
     }

     RFC1918 = {
         description = "Private IP space"
         networks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
     }

     RFC2544 = {
         description = "Benchmarking Subnet"
         networks = ["198.18.0.0/15"]
     }

     RFC3927 = {
         description = "APIPA Link Local Address range"
         networks = ["169.254.0.0/16"]
     }

     RFC5737 = {
         description = "Documentation IPs"
         networks = ["192.0.2.0/24", "198.51.100.0/24", "203.0.113.0/24"]
     }

     RFC5771 = {
         description = "Multicast IP space"
         networks = ["224.0.0.0/4"]
     }

     RFC6890 = {
         description = "IETF Protocol Assignments"
         networks = ["192.0.0.0/24"]
     }

}

network_includes = {
     RFCs_to_block = {
         includes = ["RFC6890", "RFC2544", "RFC3927", "RFC5737", "RFC1918"]
     }
}

address_groups = {
  DNS_SERVERS = {
    address = ["10.8.6.9"]
  }
}

vyos_vms = {
  vyos_vm_1 = {
    name = "vyos-vm-1"
    vm_id = 20111
    node_name = "fichina"
    mgmt_addr = "10.20.10.11"
    mgmt_subnet = "16"
    node_id    = 1
  }
  vyos_vm_2 = {
    name = "vyos-vm-2"
    vm_id = 20112
    node_name = "zoness"
    mgmt_addr = "10.20.10.12"
    mgmt_subnet = "16"
    node_id    = 2
  }
}

vyos_n100s = {
  vyos_n100_1 = {
    name = "vyos-n100-1"
    mgmt_addr = "10.20.10.1"
    mgmt_subnet = "16"
    node_id    = 1
  }
  #vyos_n100_2 = {
  #  name = "vyos-n100-2"
  #  mgmt_addr = "10.20.10.2"
  #  mgmt_subnet = "16"
  #  node_id    = 2
  #}
}
