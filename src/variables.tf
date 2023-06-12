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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILuiAAX7bepyVM9Y6PKnH5g6bbP1NzwT5SpscGqpgmaz mailo@DESKTOP-D2OQD34"
  description = "ssh-keygen -t ed25519"
}

###vm vars vm_web

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of vm"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_web_cp_cores" {
  type        = number
  default     = 2
  description = "number of cpu cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  description = "ram size"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "% of core fraction"
}

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "os family"
}

###vm vars vm_db

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of vm"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_db_cp_cores" {
  type        = number
  default     = 2
  description = "number of cpu cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "ram size"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "% of core fraction"
}

variable "resources_db" {
type=map
default= {
cores =2
memory = 4
core_fraction = 20
}
}

variable "resources_web" {
type=map
default= {
cores =2
memory = 4
core_fraction = 5
}
}