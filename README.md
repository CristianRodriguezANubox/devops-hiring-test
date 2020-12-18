# Infra Nubox - Challenge Luis Parra

Challenge posulacion Nubox - Luis Parra

## Pasos 

* El archivo ubicado en infra/nbx-infra.yml es un template cloudformation donde está la declaración del stack completo para desplegar la infraestructura requerida. Los recursos creados fueron: VPC, Subredes, NAT Gateways, Route Tables, Internet Gateway, Security Groups, Application Load Balancer, Target Group, Launch Configuration, AutoScaling Group.
* El archivo deploy_infra.sh es una shell que permite la creación, actualización o eliminación del stack. Este recibe como parámetros: la Opción a ejecutar (create, update,delete), el Nombre del Stack y el KeyPair (.pem) que sirve para crear las instancias EC2.
* 