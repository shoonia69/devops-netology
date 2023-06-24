###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "os family"
}

variable "public_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO1NnuzRFOSHFEeqmySs9FamY6K0h8EqXNP77ma/o2lA pshun@laptop"
  description = "its a ssh key"  
}

variable "secondary_disk_name" {
  type = list(object({
    disk_id = string
    }))
  default = [
    { disk_id = "disk-0" },
    { disk_id = "disk-1" },
    { disk_id = "disk-2" }
  ]
}