resource "proxmox_virtual_environment_vm" "vyos_rtr_vms" {
  name        = var.node.name
  description = "managed by opentofu"
  tags        = ["opentofu", "debian", "vyos"]
  started                 = true
  template                = false
  keyboard_layout         = "en-us"
  migrate                 = false
  on_boot                 = true
  reboot                  = false
  stop_on_destroy         = true


  node_name = var.node.hypervisor_node
  vm_id     = var.node.hypervisor_vm_id

  agent {
    enabled = true
  }

  boot_order = [
    "virtio0",
  ]

  disk {
    datastore_id = "ceph_rbd"
    import_from  = "cephfs:import/vyos-1.5-rolling-202512250042-qcow2-amd64.qcow2"
    interface    = "virtio0"
    iothread    = true
    size         = 10
  }

  initialization {
    interface = "scsi0"
    datastore_id = "ceph_rbd"
    user_data_file_id = "cephfs:snippets/vyos_api.yml"
    ip_config {
      ipv4 {
        address = join("/",[var.node.mgmt_addr,var.node.mgmt_subnet])
      }
    }
  }

  network_device {
    disconnected = false
    bridge = "vmbr1"
    model = "virtio"
    vlan_id = "20"
  }

  # hardcoded 2 physical interfaces, going to g0/3, vlans 1111,1112,1121,1122
  network_device {
    disconnected = false
    bridge = "vmbr4001"
    model = "virtio"
    vlan_id = "${1110 + var.node.node_id}"
  }

  network_device {
    disconnected = false
    bridge = "vmbr4001"
    model = "virtio"
    vlan_id = "${1120 + var.node.node_id}"
  }

  network_device {
    disconnected = false
    bridge = "vmbr1"
    model = "virtio"
  }

  serial_device {
    device = "socket"
  }

  cpu {
    cores        = 4
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
    units        = 1024
  }

  memory {
    dedicated      = 4096
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  vga {
    #enabled = false
    memory  = 16
    type    = "std"
  }
  timeout_clone           = 1800
  timeout_create          = 1800
  timeout_migrate         = 1800
  timeout_reboot          = 1800
  timeout_shutdown_vm     = 1800
  timeout_start_vm        = 1800
  timeout_stop_vm         = 300


  lifecycle {
    ignore_changes = [
      #network_device[6].disconnected,
      initialization[0].user_account,  # This ignores changes to the user_account block within initialization
      #vga[0].enabled,  # This ignores changes to the user_account block within initialization
    ]
  }
}

