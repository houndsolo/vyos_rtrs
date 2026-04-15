resource "vyos_protocols_bgp" "bgp_AS_definition" {
  system_as = var.node.asn
}

resource "vyos_protocols_bgp_neighbor" "bgp_neighbor_BM_to_VM" {
  identifier = { neighbor = "" }
}
