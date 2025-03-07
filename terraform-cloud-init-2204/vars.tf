variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKJXaLale1naO5WM5jdqujD6wtTFUEFBmaGDbFKf1bUg ermo.saarits@gmail.com"
}
variable "proxmox_host" {
  default = "proxmox1"
}
variable "template_name" {
  default = "ubuntu-2204-cloudinit-template"
}
