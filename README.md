# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Задание 1

4. Инициализируйте проект, выполните код. Исправьте намеренное допущенные ошибки. Ответьте в чем заключается их суть?

Ответ:

```
Error: Error while requesting API to create instance: server-request-id = 4677302a-d6d1-49af-bc12-68d02eaa7248 server-trace-id = c76bd6ceb88f7ee9:c6687d0514b57311:c76bd6ceb88f7ee9:1 client-request-id = 335523b5-5fbb-45fc-b702-cd5c984ff76f client-trace-id = 44fba534-4fdd-4d57-99c6-ca40948cf296 rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4
```
Количество ядер не является допустимым, изначально в примере использовалось значение 1, изменил на 2.

5. Ответьте, как в процессе обучения могут пригодиться параметры```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ? Ответ в документации Yandex cloud.

Ответ: ```preemptible = true``` дает возможность останавливать наши ВМ, ```core_fraction=5``` ВМ с уровнем производительности меньше 100% предназначены для запуска приложений, не требующих высокой производительности и не чувствительных к задержкам. Таким образом, данные настройки помогают нам экономить денежные средства при обучении.

![image](https://github.com/shoonia69/devops-netology/assets/102481493/d384512a-a1ae-4da9-9197-644943890d25)
![image](https://github.com/shoonia69/devops-netology/assets/102481493/ecb86049-4fbc-4598-9858-13faf0b3b44d)

### Задание 2

1. Изучите файлы проекта.
2. Замените все "хардкод" **значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan (изменений быть не должно).

   Ответ:
   https://github.com/shoonia69/devops-netology/blob/terraform-02/src/variables.tf

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ(в файле main.tf): **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите ее переменные с префиксом **vm_db_** в том же файле('vms_platform.tf').
3. Примените изменения.

    Ответ:
   https://github.com/shoonia69/devops-netology/blob/terraform-02/src/vms_platform.tf

### Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```

```
$ terraform.exe output
vm_external_ip_address_db = "130.193.37.226"
vm_external_ip_address_web = "51.250.12.1"
```
### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
2. Замените переменные с именами ВМ из файла variables.tf на созданные вами local переменные.
3. Примените изменения.

    Ответ:
   https://github.com/shoonia69/devops-netology/blob/terraform-02/src/locals.tf

### Задание 6

1. Вместо использования 3-х переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедените их в переменные типа **map** с именами "vm_web_resources" и "vm_db_resources".
2. Так же поступите с блоком **metadata {serial-port-enable, ssh-keys}**, эта переменная должна быть общая для всех ваших ВМ.
3. Найдите и удалите все более не используемые переменные проекта.
4. Проверьте terraform plan (изменений быть не должно).

### Правила приема работы

В git-репозитории, в котором было выполнено задание к занятию "Введение в Terraform", создайте новую ветку terraform-02, закомитьте в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформите в md-файле в ветке terraform-02.

В качестве результата прикрепите ссылку на ветку terraform-02 в вашем репозитории.




