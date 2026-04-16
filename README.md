GThis opentofu project is for configuring some VyOS routers. We are using MP-BGP and VPNv4. VyOS currently can only do VPNv4 peering on the default VRF, so this will be our Infra VRF.

Other VRFs are:
WAN
Guest
Homelab
Personal
VPNs


Logical Topology

                           Internet / Upstream
                                  |
                           +---------------+
                           |    FW-WAN     |
                           |  Edge Router  |
                           +---------------+
                              /         \
                             /           \
                  +-------------------+   +-------------------+
                  |     VyOS-BM-1     |   |    VyOS-BM-2      |
                  |  Bare Metal Core  |   |  Bare Metal Core  |
                  +-------------------+   +-------------------+
                      |             \       /             |
                      |              \     /              |
                      |               \   /               |
                      |                X X                |
                      |               /   \               |
                      |              /     \              |
                      |             /       \             |
                  +-------------------+   +-------------------+
                  |      VyOS-VM-1     |  |      VyOS-VM-2     |
                  |Virtual-Distribution|  |Virtual-Distribution|
                  +-------------------+   +-------------------+

                  
Physical Topology

                             Internet / Upstream
                                  |
                         ┌─────────────────────┐
                         │       FW-WAN        │
                         │   Bare Metal Router │
                         └──────────┬──────────┘
                                    │
                                    │
               ┌────────────────────┴────────────────────┐
               │                                         │
      ┌────────▼────────┐                       ┌────────▼────────┐
      │     CORE-1      │                       │     CORE-2      │
      │ Bare Metal  1   │                       │ Bare Metal  2   │
      └────────┬────────┘                       └────────┬────────┘
               │                                         │
               │  transit VLANs via switch fabric        │
               │                                         │
      ┌────────▼─────────────────────────────────────────▼────────┐
      │                    Switching Fabric                       │
      │      Connected to Proxmox Cluster hosting VMs             |
      │                                                           |
      │   VLAN 1111   CORE-1 <-> DIST-1                           │
      │   VLAN 1112   CORE-1 <-> DIST-2                           │
      │   VLAN 1121   CORE-2 <-> DIST-1                           │
      │   VLAN 1122   CORE-2 <-> DIST-2                           │
      └────────┬─────────────────────────────────────────┬────────┘
               │                                         │
               │                                         │
         ┌─────▼─────┐                             ┌─────▼─────┐
         │  DIST-1   │                             │  DIST-2   │
         │ VyOS VM 1 │                             │ VyOS VM 2 │
         └───────────┘                             └───────────┘
         
## Required local variables

This project expects several local-only variables for API authentication and access provisioning. I have gitignored them `passwords.tf`

```
variable "vyos_key" {
  type    = string
  default = "api_key"
}
variable "pve_api_token" {
  default = "tofu@pve!infra=api_key"
}
variable "ssh_keys" {
  description = "ssh pubkey"
  type        = list
  default     = ["ssh-rsa rsa_pubkey"]
}
```



ToDo

- VRRP setup for 10.9.0.5/16
- advertising this subnet into lylat_lan VRF on VM routers
- sharing to BM routers, FW-WAN 
- test VRRP failure scenerios
- VXLAN l3 out into lylat_vxlan vrf
