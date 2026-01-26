resource "vyos_firewall_group_interface_group" "first" {
  for_each = var.interface_groups

  identifier = { interface_group = each.key }

  description = try(each.value.description, null)
  interface = try(each.value.interfaces, [])
  include   = try(each.value.includes, [])
}

resource "vyos_firewall_group_network_group" "first" {
  for_each = var.network_groups

  identifier = { network_group = each.key }

  description = try(each.value.description, null)
  network = try(each.value.networks, [])
  include   = try(each.value.includes, [])
}

resource "vyos_firewall_group_address_group" "first" {
  for_each = var.address_groups

  identifier = { address_group = each.key }

  description = try(each.value.description, null)
  address = try(each.value.address, [])
  include   = try(each.value.includes, [])
}



resource "vyos_firewall_group_interface_group" "second" {
  depends_on = [
    resource.vyos_firewall_group_interface_group.first,
    resource.vyos_firewall_group_network_group.first,
    resource.vyos_firewall_group_address_group.first,
  ]
  for_each = var.interface_includes

  identifier = { interface_group = each.key }

  description = try(each.value.description, null)
  interface = try(each.value.interfaces, [])
  include   = try(each.value.includes, [])
}

resource "vyos_firewall_group_network_group" "second" {
  depends_on = [
    resource.vyos_firewall_group_interface_group.first,
    resource.vyos_firewall_group_network_group.first,
    resource.vyos_firewall_group_address_group.first,
  ]
  for_each = var.network_includes

  identifier = { network_group = each.key }

  description = try(each.value.description, null)
  network = try(each.value.networks, [])
  include   = try(each.value.includes, [])
}

resource "vyos_firewall_group_address_group" "second" {
  depends_on = [
    resource.vyos_firewall_group_interface_group.first,
    resource.vyos_firewall_group_network_group.first,
    resource.vyos_firewall_group_address_group.first,
  ]
  for_each = var.address_includes

  identifier = { address_group = each.key }

  description = try(each.value.description, null)
  address = try(each.value.address, [])
  include   = try(each.value.includes, [])
}
