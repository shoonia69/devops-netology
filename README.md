Задача 1
Создайте собственный образ любой операционной системы (например ubuntu-20.04) с помощью Packer (инструкция).
Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.

Решение 1
![image](https://github.com/shoonia69/devops-netology/assets/102481493/dfd7392c-6fcf-4065-945d-b401368a2789)

Задача 2
2.1. Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.

Решение 2
![image](https://github.com/shoonia69/devops-netology/assets/102481493/aff91bd7-eaa7-4466-9634-9286aa43323b)

Задача 3

С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana. Используйте Ansible-код в директории (src/ansible).
Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в docker-compose, должны быть в статусе "Up".

Решение 3

[mailo@fhm0blproaotmd0fccn1 stack]$ sudo docker ps
CONTAINER ID   IMAGE                              COMMAND                  CREATED          STATUS                            PORTS                                                                              NAMES
abb3b2d7f188   grafana/grafana:7.4.2              "/run.sh"                34 seconds ago   Up 9 seconds                      3000/tcp                                                                           grafana
2f1e3e5bb325   gcr.io/cadvisor/cadvisor:v0.47.0   "/usr/bin/cadvisor -…"   34 seconds ago   Up 8 seconds (health: starting)   8080/tcp                                                                           cadvisor
1cdb2fc91df0   prom/pushgateway:v1.2.0            "/bin/pushgateway"       34 seconds ago   Up 8 seconds                      9091/tcp                                                                           pushgateway
5a1049d95d13   prom/prometheus:v2.17.1            "/bin/prometheus --c…"   34 seconds ago   Up 9 seconds                      9090/tcp                                                                           prometheus
94f63b29c85b   prom/alertmanager:v0.20.0          "/bin/alertmanager -…"   34 seconds ago   Up 9 seconds                      9093/tcp                                                                           alertmanager
c270ce61fcec   prom/node-exporter:v0.18.1         "/bin/node_exporter …"   34 seconds ago   Up 8 seconds                      9100/tcp                                                                           nodeexporter
728c4ce90a8d   stefanprodan/caddy                 "/sbin/tini -- caddy…"   34 seconds ago   Up 8 seconds                      0.0.0.0:3000->3000/tcp, 0.0.0.0:9090-9091->9090-9091/tcp, 0.0.0.0:9093->9093/tcp   caddy

Задача 4

Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
Используйте для авторизации логин и пароль из .env-file.
Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками(dashboards).
Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.
Чтобы получить зачёт, предоставьте:
скриншот работающего веб-интерфейса Grafana с текущими метриками, как на примере ниже.

Решение 4

![image](https://github.com/shoonia69/devops-netology/assets/102481493/85205d0d-ec4f-43d3-a008-46aa12dc40f0)
