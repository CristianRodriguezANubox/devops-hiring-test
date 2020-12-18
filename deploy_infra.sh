#!/bin/bash

# Usar: ./deploy_infra.sh <OPTION> <STACKNAME> <PATH_TO_KEYPAIR>

OPTION=$1
STACKNAME=$2
KEYPAIR=$3

case $OPTION in
    create) create=true
    ;;
    update) update=true
    ;;
    delete) delete=true
    ;;
    *)
        echo "Invalid option $OPTION: Allowed value are [create, update, delete]"
    ;;
esac

if [ $create == true ]; then
    echo "Creando Infra Nubox"
    aws cloudformation create-stack --stack-name $STACKNAME --template-body file://infra/nbx-infra.yml --parameters ParameterKey=KeyPairName,ParameterValue=$KEYPAIR
fi

if [ $update == true ]; then
    echo "Actualizando Infra Nubox"
    aws cloudformation update-stack --stack-name $STACKNAME --template-body file://infra/nbx-infra.yml --parameters ParameterKey=KeyPairName,ParameterValue=$KEYPAIR
fi

if [ $delete == true ]; then
    echo "Actualizando Infra Nubox"
    aws cloudformation delete-stack --stack-name $STACKNAME
fi