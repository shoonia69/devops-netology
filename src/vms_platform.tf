data "yandex_compute_image" "ubuntu" {
  family = var.vm_os_family
}
resource "yandex_compute_instance" "web" {
  name        = local.web
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.resources_web["cores"]
    memory        = var.resources_web["memory"]
    core_fraction = var.resources_web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}





resource "yandex_compute_instance" "db" {
  name        = local.db
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.resources_db["cores"]
    memory        = var.resources_db["memory"]
    core_fraction = var.resources_db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}