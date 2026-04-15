resource "vyos_protocols_bgp" "bgp_AS_definition" {
  system_as = var.vyos_n100.asn
}
