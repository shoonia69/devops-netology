resource "yandex_compute_disk" "secondary_disk" {
  name       = "disk-${ count.index }"
  type       = "network-hdd"
  size       = 1
  
  count = 3
}

resource "yandex_compute_instance" "vm_storage" {
  name        = "storage"
  platform_id = "standard-v1"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = 5
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]   
  }
  allow_stopping_for_update = true

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.secondary_disk.*.id
    content {
      disk_id     = secondary_disk.value
    }
  }
}