#!/bin/bash
ACTION=$1
STACKNAME=$2
KEYPAIR=challengepair
echo aws cloudformation create-stack --stack-name $STACKNAME --template-body file://infra.yaml --parameters ParameterKey=KeyName,ParameterValue=$KEYPAIR

function create {
    aws cloudformation validate-template --template-body file://infra.yaml
    aws cloudformation create-stack --stack-name $STACKNAME --template-body file://infra.yaml --parameters ParameterKey=KeyName,ParameterValue=$KEYPAIR
}
function update {
    aws cloudformation update-stack --stack-name $STACKNAME --template-body file://infra.yaml --parameters ParameterKey=KeyName,ParameterValue=$KEYPAIR
}
function delete {
    aws cloudformation delete-stack --stack-name $STACKNAME 
}

case $ACTION in
    create)
        create
    ;;
    update)
        update
    ;;
    delete)
        delete
    ;;
    *)
        echo "Opcion invalida"
    ;;
esac