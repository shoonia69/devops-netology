resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

     { webservers = yandex_compute_instance.web-vm
     
     database = yandex_compute_instance.each_vm
     
     storage = [yandex_compute_instance.vm_storage] }

     )

  filename = "${abspath(path.module)}/hosts.cfg"
}



