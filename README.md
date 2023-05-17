Задача 1
Опишите основные преимущества применения на практике IaaC-паттернов.
Какой из принципов IaaC является основополагающим?

Решение 1
IaaC-паттерны (Infrastructure as Code) - это подход к управлению инфраструктурой, при котором ее создание и настройка осуществляются с помощью программного кода. 
Можно выделить следующие основные преимущества применения IaaC-паттернов: автоматизация, контроль версий, разбиение инфраструктуры на составные части, быстрое создание и уничтожение инфраструктуры,  безопасное управлением инфраструктурой.
Основополагающим принципом IaaC (Infrastructure as Code) является автоматизация процессов создания, настройки и управления инфраструктурой через код. Этот принцип позволяет достичь быстроты, надежности и единообразия в работе с инфраструктурой, а также уменьшить риск ошибок.

Задача 2
Чем Ansible выгодно отличается от других систем управление конфигурациями?
Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

Решение 2
Ansible выгодно отличается от других систем управления конфигурациями по несмкольким причинам:
- Он написан на простом универсальном языке Python
- Использует push метод работы. Благодаря этому не требуется устанавливать дополнительные агенты на целевые хосты, а достаточно всего ssh соединения.
Метод push по моему мнению является более надежным и простым. Как уже было написано выше, он не требует установки агента, следовательно минимизируется риск отказа ПО со стороны целевого хоста.

Задача 3
Установите на личный компьютер:
VirtualBox,
Vagrant,
Terraform,
Ansible.
Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.
Решение 3
```
[mailo@fedora netology]$ vagrant --version
Vagrant 2.3.4
[mailo@fedora netology]$ terraform --version
Terraform v1.4.6
on linux_amd64
[mailo@fedora netology]$ ansible --version
ansible [core 2.14.5]
  config file = /home/mailo/vms/netology/ansible.cfg
  configured module search path = ['/home/mailo/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/mailo/.local/lib/python3.11/site-packages/ansible
  ansible collection location = /home/mailo/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/mailo/.local/bin/ansible
  python version = 3.11.3 (main, Apr  5 2023, 00:00:00) [GCC 13.0.1 20230401 (Red Hat 13.0.1-0)] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
[mailo@fedora netology]$ vboxmanage --version
7.0.8r156879
```
Задача 4
Воспроизведите практическую часть лекции самостоятельно.
Создайте виртуальную машину.
Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды docker ps

Решение 4
```
[mailo@fedora netology]$ vagrant ssh
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed 17 May 2023 06:34:55 PM UTC

  System load:  0.12               Users logged in:          1
  Usage of /:   13.4% of 30.34GB   IPv4 address for docker0: 172.17.0.1
  Memory usage: 24%                IPv4 address for eth0:    10.0.2.15
  Swap usage:   0%                 IPv4 address for eth1:    192.168.56.11
  Processes:    161


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Wed May 17 18:33:54 2023
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
vagrant@server1:~$ 
```
