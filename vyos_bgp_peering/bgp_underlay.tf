resource "vyos_protocols_bgp" "bgp_AS_definition" {
  system_as = var.node.asn
}

resource "vyos_protocols_bgp_neighbor" "bgp_neighbor_BM_to_VM" {
  for_each = local.bgp_neighbors
  identifier = { neighbor = each.value.neighbor_ip }
  remote_as = each.value.remote_as
  description = each.value.description
  address_family = {
    ipv4_vpn = {
    }
  }
}
