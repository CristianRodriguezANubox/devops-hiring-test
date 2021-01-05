# Hiring Test DevOps Nubox
![Nubox!!!!](https://info.nubox.com/hubfs/nubox-logo.png "nubox")

## El Desafío

### Infraestructura de Cloudformation con nested stack

Se generan 3 archivos de CF **vpc, webserver, pipeline** los cuales se ejecutan con cloudformation nested stack.

#### **CF vpc** 
Genera la infraestructura de Red necesaria para la conectividad a los ambientes.
- incluye VPC, 2 public / private subnet, SG, NAT, IGW.

#### **CF webserver**
Es el encargado de crear los recursos de cómputo necesarios.
- incluye ASG, LaunchConfiguration, SG, ALB, SSM session manager.

#### **pipeline**
Realiza la configuración de un pipeline con las herramientas de AWS.
- incluye S3 para Artifacts, CodeCommit, CodeBuild, CodeDeploy, CodePipeline.

### Entorno

El entorno se configuro en una cuenta ***nueva*** dentro de una Organización existente, la cual contiene solamente el entorno que se automatizo para Nubox.  
En esta cuenta se puede crear el ambiente desde Cloud9, ya que contiene todo lo necesario para generar el ambiente.

> Se utilizo la creación del ambiente con Nested Stack en un cuenta con SSO ya que es la recomendación en general de AWS. El entorno contiene buenas prácticas de Roles y policy aunque existe margen de mejora en seguridad. Se esta utilizando SSM sessión manager en vez de Bastion Hosts.

### Pasos

1. Entrar a [Cloud9](https://us-west-2.console.aws.amazon.com/cloud9/ide/a36598f065cc4910ae562cda2fe23877)

2. Dentro del directorio **Jean-Paul** se encontrará un archivo ***nestedStack.sh*** el cual permite:
- - Crear el Nested Stack
- - Actualizar Nested Stack con una nueva PEM (KeyName). *Existen 2 PEM por default, nubox y nubox2*.
- - Borrar el Nested Stack.
> la url de la pagina web de ejemplo se puede encontrar dentro del outputs de el cloudformation del *webserver*.

3. **Cloud9** contiene otro directorio el cual se llama *nubox-Repository* y esta "enlazado" con CodeCommit. 
> Para probar el pipeline, dentro de *nubox-Repository* se debe ejecutar `git push`

> El pipeline descarga el código desde CodeCommit, utiliza CodeBuild para levantar un ambiente, el cual prueba que la pagina contenga la palabra *nubox*, al finalizar la prueba se realiza el Deploy de la nueva web con CodeDeploy.