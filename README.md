# Hiring Test DevOps Nubox
![Nubox!!!!](/img_nubox/nubox_img.png?raw=true "nubox")

## [GitHubRepository](https://github.com/CristianRodriguezANubox/devops-hiring-test)

## Introducción
El objetivo del test es que se use cloudformation para crear la infraestructura y github actions o circleci para la automatización.

## Tecnologías a Usar
- CloudFormation para crear los recursos de la Infraestructura, diagrama mas abajo.
- Circleci para automatizar la subida de archivos a un bucket S3

## El Desafío
### Crear la siguiente infraestructura
![Nubox!!!!](/infra_img/infra_test.png?raw=true "nubox")

### Crear un HTML
- Este HTML debe ser muy basico solo que diga ¡Hola Nubox! con la imagen de Nubox que esta presente en este mismo repositorio

### Servidor
- Esta infraestructura debe crear un servidor apache desde el codigo y el HTML con sus componentes deben estar en formato zip, en el arranque del codigo se debe hacer un unzip y mover el HTML junto a sus componentes a la carpeta necesaria del apache para que se muestre en la web.

### CI/CD
- Usando Github actions o circleci se debe realizar lo siguiente:
1.- Scanner del codigo
2.- Hola Nubox
3.- Subir html en formato zip a un bucket 

### Entregables
- Codigo Bash para crear, actualizar y destruir la infraestructura
- Se debe entregar el desafio creando un branch en el mismo repositorio con su nombre.
- El repositorio debe venir con un README del paso a paso que se efectuo
- En el README debe venir el Badge de status que los pasos se efectuaron de manera exitosa

![Nubox!!!!](/img_extras/badge_passed.png?raw=true "nubox")


- En el repositorio debe venir un print de pantalla mostrando el webserver con el HTML



