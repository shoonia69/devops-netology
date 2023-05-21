Задача 1
Сценарий выполнения задачи:
создайте свой репозиторий на https://hub.docker.com;
выберите любой образ, который содержит веб-сервер Nginx;
создайте свой fork образа;
реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
Опубликуйте созданный fork в своём репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

Решение 1.
https://hub.docker.com/repository/docker/shoonia69/custom-nginx/general

Задача 2
Посмотрите на сценарий ниже и ответьте на вопрос: «Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?»
Детально опишите и обоснуйте свой выбор.
--
Сценарий:
высоконагруженное монолитное Java веб-приложение;
Nodejs веб-приложение;
мобильное приложение c версиями для Android и iOS;
шина данных на базе Apache Kafka;
Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;
мониторинг-стек на базе Prometheus и Grafana;
MongoDB как основное хранилище данных для Java-приложения;
Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry.

Решение 2.
высоконагруженное монолитное Java веб-приложение - считаю, что не подойдет. Потому что, монолитное приложение содержит в себе множество компонентов, в рамках контейнера это может быть затруднительно реализовать. Стоит рассмотреть использование паравиртуализации или физических машин.
Nodejs веб-приложение - контейнеризация может подойти при разработке самого приложения и его использваонии.
мобильное приложение c версиями для Android и iOS - считаю, что удобно использовать контейнеризацию при разработке приложений. Есть возможность собирать разные версии и сборки для последующего тестирования.
шина данных на базе Apache Kafka - является высоконагруженым и ресурсоемким приложение, состоящим из большого количества компонетов. Считаю, что контейнеризация не подходит для реализации данной технологии, лучше использовать физические сервера или паравиртуализацию.
Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana - можно использовать контейнеризацию, kibana является веб приложением, Elasticsearch можно также развернуть в контейнере с привязкой базы данных на физическом хосте. Есть необходимые контейнеры в репозитории Docker.
мониторинг-стек на базе Prometheus и Grafana - считаю что данный варинат вполне возможно выполнить посредством контейнеризации с настройкой хранения логов на внешней БД.
MongoDB как основное хранилище данных для Java-приложения - MongoDB есть официальный контейнер в репозитории, можно использовать в свяке с другими контейнерами. Такой варинат вполне подходит для реализации путем контейнеров.
Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry - в данном случае я бы использовал виртуализацию или физические сервера. Проще возможности бэкапирования, меньше риска потери данных из Gitlab сервера.

Задача 3
Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера.
Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера.
Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.
Добавьте ещё один файл в папку /data на хостовой машине.
Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.

Решение 3
Список команд для выполнения задания
```
[root@ps-cent-n ~]# docker run -d centos sleep infinity
bb526762a08ae51a779c53683b64b3cef1210e2c1a15c6443c6cb11465a53341
[root@ps-cent-n ~]#
[root@ps-cent-n ~]#
[root@ps-cent-n ~]# docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS     NAMES
bb526762a08a   centos    "sleep infinity"   3 seconds ago   Up 2 seconds             recursing_pasteur
[root@ps-cent-n ~]# docker stop recursing_pasteur
recursing_pasteur
[root@ps-cent-n ~]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@ps-cent-n ~]# clear
[root@ps-cent-n ~]# docker run -d -v /data:/data centos sleep infinity
6558adc68dda5bbb6230cd641a09ac66c13126560d44ef98b6c3150335b8ba2d
[root@ps-cent-n ~]# docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS     NAMES
6558adc68dda   centos    "sleep infinity"   3 seconds ago   Up 2 seconds             flamboyant_hofstadter
[root@ps-cent-n ~]# docker run -d -v /data:/data debian sleep infinity
1ae6dbc6c7d7b4c141ac6fc9aa0272c7c2f0e1c25baeb2da0087d74367d54169
[root@ps-cent-n ~]# docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
1ae6dbc6c7d7   debian    "sleep infinity"   4 seconds ago    Up 3 seconds              gracious_lalande
6558adc68dda   centos    "sleep infinity"   34 seconds ago   Up 34 seconds             flamboyant_hofstadter
[root@ps-cent-n ~]# docker exec -it flamboyant_hofstadter bash
[root@6558adc68dda /]# ls /data
[root@6558adc68dda /]# touch /data/file-from-centos-cont
[root@6558adc68dda /]# ls /data
file-from-centos-cont
[root@6558adc68dda /]# exit
exit
[root@ps-cent-n ~]# touch /data/file-from-host
[root@ps-cent-n ~]# docker exec -it gracious_lalande bash
root@1ae6dbc6c7d7:/# ls /data
file-from-centos-cont  file-from-host
root@1ae6dbc6c7d7:/#
```

Задача 4 (*)
Воспроизведите практическую часть лекции самостоятельно.
Соберите Docker-образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.

Решение 4.
Собрать образ по докерфайлу из задания не получилось.
Собрал свой, за основу взят fedora:latest.
По ссылке доступен контейнер с утановленным Ansible.
Не совсем понимаю как используется параметр CMD в докерфайле. При сборке все происходит штатно, но контейнер с аргументом CMD  [ "ansible-playbook", "--version" ] выдает ошибку при старте 
```
docker: Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "ansible": executable file not found in $PATH: unknown.
```
Поэтому в сборке  по ссылке он не использовался в файде Dockerfile.
https://hub.docker.com/repository/docker/shoonia69/fedora-ansible/general
