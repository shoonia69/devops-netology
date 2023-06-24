 variable "vm_each_list" {
  type = list(object({
    vm_name = string
    cpu     = number
    ram     = number
    disk    = number
    core_fraction = number
  }))
  default = [
    { vm_name = "main", cpu = 2, ram = 1, disk = 5, core_fraction = 5 },
    { vm_name = "replica", cpu = 4, ram = 2, disk = 10, core_fraction = 20 }
  ]
}

resource "yandex_compute_instance" "each_vm" {
 platform_id = "standard-v1"
for_each = { for i in var.vm_each_list : i.vm_name => i }
name = each.value.vm_name
depends_on = [ yandex_compute_instance.web-vm ]

 resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
 }

 boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = each.value.disk
    }   
  }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

 # provisioner "file" {
 #   source = "~/.ssh/id_rsa.pub"    
 #   destination = "/etc/"
 # }
 #   metadata = {
 #   serial-port-enable = 1
 #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

