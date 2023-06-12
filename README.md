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

### Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```

```
$ terraform.exe output
vm_external_ip_address_db = "130.193.37.226"
vm_external_ip_address_web = "51.250.12.1"
```

### Правила приема работы

В git-репозитории, в котором было выполнено задание к занятию "Введение в Terraform", создайте новую ветку terraform-02, закомитьте в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформите в md-файле в ветке terraform-02.

В качестве результата прикрепите ссылку на ветку terraform-02 в вашем репозитории.




