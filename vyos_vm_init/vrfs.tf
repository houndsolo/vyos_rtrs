resource "vyos_vrf_name" "lylat_vrf" {
  depends_on = [resource.vyos_system.vyos_rtr_initial_config]
  identifier = { name = "lylat_vrf" }
  table = 1337
}

resource "vyos_vrf_name" "guest_vrf" {
  depends_on = [resource.vyos_vrf_name.lylat_vrf]
  identifier = { name = "guest_vrf" }
  table = 3004
}
