# Hiring Test DevOps Nubox Completo
![Nubox!!!!](/img_nubox/nubox_img.png?raw=true "nubox")

## [GitHubRepository](https://github.com/CristianRodriguezANubox/devops-hiring-test)

## Pasos

- Primer paso:
        Crear la infraestructura en un yaml de cloudformation, iniciadon con el stack de redes (vpc, subnets, security groups),
        luego crear el ruteo y salidas a internet (internet Gw, NAT GW, route tables y asociasion de subredes)
- Segundo paso:
        Crear las instancias publicas Bastion, para ser usadas como nodos de login, como parametro se le puede dar el par de llaves
        que utilizaran, además se ocupan las ami de amazon linux y el tipo de instancia es t2.micro(se despliega segun diagrama con alta dispobibilidad (2 availability zone ))
- Tercer paso:
        Crear template de despliegue para auto scaling group, donde configuramos el tipo de instancia y lo que hará en el inicio (instalacion de httpd, unzip, curl)
        descarga un archivo zip (desde un bucket s3) que contiene imagen y un index.html a ser servido por httpd o apache, el cual es descomprimido y puesto en /var/www/html, luego
        se inicia el demonio. El autoscaling depende de la creacion previa de el stack de redes para su despliegue correcto.
- Cuarto paso:
        Creación de un script bash que tiene 3 funciones, "create, delete, update", el uso de este script es `sh script-infra.sh create nombrestack`, la funcionalidad
        es crear, destruir y actualizar un stack de cfn. Se puede también indicar dentro del script la variable KEYPAIR para automatizar la creacion del stack.
- Quinto paso:
        Creación de un pipeline (Github actions) que despliega en un bucket s3 un archivo zip con el contenido index.html y logo de nubox.
        El pipeline corre un cfn-lint sobre el archivo infra.yaml mostrado los errores y optimizaciones que se pueden realizar. Luego se crea un zip con los archivos mencionados
        y por último se sube ese archivo a un bucket s3 el cual es usado para la descarga del contenido servido por las instancias web servers del autoscaling. 

![Challenge Nubox!!!!](holanubox.png?raw=true "nubox")
 - Ci corriendo en otro repo github  *https://github.com/sebbustama/holanubox*
![CI](https://github.com/sebbustama/holanubox/workflows/CI/badge.svg?branch=main&event=push)
