resource "vyos_vrf_name" "mgmt" {
  identifier = { name = "mgmt" }
  table = 8008
}

resource "vyos_vrf_name" "lylat_lan" {
  identifier = { name = "lylat_lan" }
  table = 1337
}

resource "vyos_vrf_name" "lylat_infra" {
  identifier = { name = "lylat_infra" }
  table = 700
}

resource "vyos_vrf_name" "lylat_service" {
  identifier = { name = "lylat_service" }
  table = 1000
}

resource "vyos_vrf_name" "vpn_me" {
  identifier = { name = "vpn_me" }
  table = 1200
}

resource "vyos_vrf_name" "vpn_hay" {
  identifier = { name = "vpn_hay" }
  table = 4004
}

resource "vyos_vrf_name" "vpn_vultr" {
  identifier = { name = "vpn_vultr" }
  table = 2000
}

