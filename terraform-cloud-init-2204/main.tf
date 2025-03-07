provider "proxmox" {
  pm_api_url          = "https://192.168.10.120:8006/api2/json"
  pm_api_token_id     = "root@pam!root"
  pm_api_token_secret = "d126e673-3b73-4a0a-a550-f1a4dfde0975"
  pm_tls_insecure     = true
  pm_parallel         = 20
}
resource "proxmox_vm_qemu" "test" {
  count       = 1  
  name        = "HL-test-0${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  target_node = var.proxmox_host
  clone       = var.template_name
  full_clone  = true
  agent       = 1
  vmid        = "20${count.index + 1}"
  os_type     = "cloud-init"
  #preprovision = true
  onboot      = true
  
  #HW spec
  cores    = 2
  sockets  = 1
  cpu_type  = "host"
  memory   = 2048
  #scsihw   = "virtio-scsi-pci"
  scsihw = "lsi"
  bootdisk = "virtio0"
  hotplug  = "network,disk"

disks {   
virtio {
 virtio0 {
    disk {
    storage      = "ssd-data"
    size         = "20G"
      }
    }
}
ide {
  ide2 {
    cloudinit {
    storage = "ssd-data"
        }
      }
    }
  }
  # if you want two NICs, just copy this whole network section and duplicate it   
   network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
   
    }

boot = "order=virtio0"
ipconfig0 = "ip=192.168.10.14${count.index + 1}/24,gw=192.168.10.1"


  # sshkeys set using variables. the variable contains the text of the key.
  ssh_user        = "ubuntu"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}