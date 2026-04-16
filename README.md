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
