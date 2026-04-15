resource "vyos_vrf_name" "mgmt" {
  identifier = { name = "mgmt" }
  description = "management vrf"
  table = 8008
}

