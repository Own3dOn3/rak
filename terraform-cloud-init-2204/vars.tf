variable "vm_count" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 3
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://IPADDR:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default = "TOKEN_ID"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
  default = "TOKEN_SECRET"
}

variable "target_node" {
  description = "Proxmox node where the VMs will be deployed"
  type        = string
  default     = "PROXMOX_NODE_NAME"
}

variable "template_name" {
  description = "name of the template"
  type        = string
  default     = "ubuntu-2404-cloudinit-template"
}

variable "vm_name"{
description = "name of the virtual machine"
type = string
default ="VM_NAME-0${count.index + 1}"
}
variable "cpu_cores" {
  description = "Number of CPU cores per VM"
  type        = number
  default     = 4
}

variable "memory" {
  description = "Amount of RAM per VM (MB)"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Disk size per VM"
  type        = string
  default     = "40G"
}

variable "storage" {
  description = "Storage location for the VM disk"
  type        = string
  default     = "STORAGE_NAME"
}

variable "network_bridge" {
  description = "Network bridge for the VM"
  type        = string
  default     = "vmbr0"
}

variable "ssh_public_key" {
  description = "SSH public key for user access"
  type        = string
  default = "SSH_PUB_KEY"
}

variable "ciuser"{
  description = "cloud init user to login with"
  type =string
  default ="ubuntu"
}