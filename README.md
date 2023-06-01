Задание 1:
Задача 1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
```
[mailo@fedora src]$ terraform init
Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Finding latest version of hashicorp/random...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (self-signed, key ID BD080C4571C6104C)
- Installing hashicorp/random v3.5.1...
- Installed hashicorp/random v3.5.1 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Задача 2. Изучите файл .gitignore. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?
```
personal.auto.tfvars
```
Задача 3. Выполните код проекта. Найдите в State-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
```
"result": "zM1B7mSP8OqJTicc"
```
Задача 4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла main.tf. Выполните команду terraform validate. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.
```
│ Error: Missing name for resource
│ 
│   on main.tf line 24, in resource "docker_image":
│   24: resource "docker_image" {
│ 
│ All resource blocks must have 2 labels (type, name).
```
Ошибка сообщает о том, что в нашем случае необходим 2-й лейбл.
```
Error: Invalid resource name
│ 
│   on main.tf line 29, in resource "docker_container" "1nginx":
│   29: resource "docker_container" "1nginx" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
```
Неверный символ в начале названия второго лейбла.

Дополнительно ошибки в коде main.tf
- неверный лейбл random_string_fake
- random_password.random_string_fake.resuld — неверно написано какую переменную забирать из стейт файла.

Задача 5. Выполните код. В качестве ответа приложите вывод команды docker ps
```
[mailo@fedora src]$ sudo docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
32ef3394375a   f9c14fe76d50   "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds   0.0.0.0:8000->80/tcp   example_zM1B7mSP8OqJTicc
```
Задача 6. Замените имя docker-контейнера в блоке кода на hello_world, выполните команду terraform apply -auto-approve. Объясните своими словами, в чем может быть опасность применения ключа -auto-approve ? В качестве ответа дополнительно приложите вывод команды docker ps
```
[mailo@fedora src]$ sudo docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
9fc2859c6b24   f9c14fe76d50   "/docker-entrypoint.…"   14 seconds ago   Up 14 seconds   0.0.0.0:8000->80/tcp   hello_world
```
Опасность использования ключа -auto-approve заключается в том, что все изменения применяются автоматически. В нашем случае, если бы мы не использовали данный ключ, то успели бы увидеть, что предыдущий контейнер будет уничтожен при развертывании и при необходимости смогли бы отказаться от развертывания.

Задача 7. Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
```
[mailo@fedora src]$ cat terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.4.6",
  "serial": 11,
  "lineage": "dddcd7da-18ba-3bb1-44f4-dd9a9f3247c0",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
Задача 8. Объясните, почему при этом не был удален docker образ nginx:latest ? Ответ подкрепите выдержкой из документации провайдера.
В main.tf присутвует параметр keep_locally = true
Согласно документации провайдера, если стои true то он не будет удален
```
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```
---

Задание 2
Изучите в документации provider Virtualbox от shekeriev.
Создайте с его помощью любую виртуальную машину. Чтобы не использовать VPN советуем выбрать любой образ с расположением в github из списка
В качестве ответа приложите plan для создаваемого ресурса и скриншот созданного в VB ресурса.

Решение 2:
```
[mailo@fedora virtialbox]$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # virtualbox_vm.vm1 will be created
  + resource "virtualbox_vm" "vm1" {
      + cpus   = 1
      + id     = (known after apply)
      + image  = "./centos-7.0-x86_64.box"
      + memory = "512 mib"
      + name   = "test_VM_for_homework"
      + status = "running"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```
![image](https://github.com/shoonia69/devops-netology/assets/102481493/a9010324-3645-4890-adc8-655512808bd7)
