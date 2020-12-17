# Hiring Test DevOps Nubox
![Nubox!!!!](/img_nubox/nubox_img.png?raw=true "nubox")

## [GitHubRepository](https://github.com/CristianRodriguezANubox/devops-hiring-test)

## Introducción

- Primer paso:
        Crear la infraestructura en un yaml de cloudformation, iniciadon con el stack de redes (vpc, subnets, security groups),
        luego crear el ruteo y salidas a internet (internet Gw, NAT GW, route tables y asociasion de subredes)
- Segundo paso:
        Crear las instancias publicas Bastion, para ser usadas como nodos de login, como parametro se le puede dar el par de llaves
        que utilizaran, además se ocupan las ami de amazon linux y el tipo de instancia es t2.micro(se despliega segun diagrama con alta dispobibilidad (2 availability zone ))
- Tercer paso:
        Crear template de despliegue para auto scaling group, donde configuramos el tipo de instancia y lo que hará en el inicio (instalacion de httpd, unzip, curl)
        descarga un archivo zip que contiene imagen y un index.html a ser servido por httpd o apache, el cual es descomprimido y puesto en /var/www/html, luego
        se inicia el demonio.
- Cuarto paso:
        Creación de un script bash que tiene 3 funciones, "create, delete, update", el uso de este script es `sh script-infra.sh create nombrestack`, la funcionalidad
        es crear, destruir y actualizar un stack de cfn.

![Challenge Nubox!!!!](holanubox.png?raw=true "nubox")

