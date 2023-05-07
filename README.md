# devops-netology

какие файлы будут проигнорированы в будущем благодаря добавленному .gitignore в папке terraform

Исключить все файлы внутри папок .terraform
**/.terraform/* 

Исключить все файлы с расширением tfstate
*.tfstate 
*.tfstate.* 

Исключить лог файл crash и другие логи содержашие crash в названии
crash.log
crash.*.log

Исключить все файлы с расширением tfvars
*.tfvars 
*.tfvars.json

Исключить 2 файла и все файлы в имени которых будут *_override.tf и *_override.tf.json 
override.tf 
override.tf.json 
*_override.tf 
*_override.tf.json 

Исключить 2 файла конфигураций
.terraformrc
terraform.rc

новая строчка для ДЗ по гиту 
