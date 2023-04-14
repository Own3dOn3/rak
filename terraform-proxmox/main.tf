provider "proxmox" {
  pm_api_url          = "https://x.x.x.x:8006/api2/json"
  pm_api_token_id     = "root@pam!root"
  pm_api_token_secret = ""
  pm_tls_insecure     = true
  pm_parallel         = 20
}
resource "proxmox_vm_qemu" "test" {
  count       = 1
  name        = "var.hostname${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  target_node = var.proxmox_host
  clone       = var.template_name
  full_clone  = true
  agent       = 1
  vmid        = "100${count.index + 1}"
  os_type     = "cloud-init"
  #preprovision = true
  onboot      = true
  #balloon = "1"
  #numa = "true"
  #clone_wait = 1


  #HW spec
  cores    = 4
  sockets  = 1
  cpu      = "host"
  memory   = 4096
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  hotplug  = "network,disk"


  disk {
    slot     = 0
    size     = "16G"
    type     = "scsi"
    storage  = "ssd-data"
    #iothread = 1
    #storage_type = "lvm"
  }
  disk {
    slot     = 1
    size     = "20G"
    type     = "scsi"
    storage  = "hdd-data"
    #iothread = 1
    #storage_type = "lvm"
  }

  # if you want two NICs, just copy this whole network section and duplicate it
  network {
    model  = "virtio"
    bridge = "vmbr0"


  }

  os_network_config =  <<EOF
   "ip=var.ip${count.index + 1}/24,gw=var.gateway"
EOF

  #

  #not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # sshkeys set using variables. the variable contains the text of the key.
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}