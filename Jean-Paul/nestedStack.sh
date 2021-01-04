#!/bin/bash
ACTION=$1
STACKNAME=$2
KEYPAIR=$3

# Ejemplo create: ./nestedStack.sh create nubox nubox2
# Ejemplo update: ./nestedStack.sh update nubox nubox
# Ejemplo delete: ./nestedStack.sh delete

function create {
    aws cloudformation validate-template --template-body file://CF/nested.yaml
    aws cloudformation create-stack --stack-name $STACKNAME --template-body file://CF/nested.yaml --capabilities CAPABILITY_NAMED_IAM --disable-rollback --parameters ParameterKey=KeyName,ParameterValue=$KEYPAIR
}
function update {
    aws cloudformation update-stack --stack-name $STACKNAME --template-body file://CF/nested.yaml  --parameters ParameterKey=KeyName,ParameterValue=$KEYPAIR
}
function delete {
    aws s3 rm s3://nubox-app-artifacts --recursive 
    sleep 10
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