#!/usr/bin/env bash

set -e

AWS_PROFILE=${1}
AWS_ECR_USER=${2}

ENV_NAME=${3}
APP_NAME=${4}

STACK_NAME="${APP_NAME}-${ENV_NAME}-ecr-stack"

echo ${AWS_ECR_USER}

# Check arguments
if [[ $# -eq 0 ]]
  then
    echo "No argument supplied"
    exit 1
fi

aws cloudformation create-stack \
    --stack-name ${STACK_NAME} \
    --template-body file://template.yml \
    --parameters ParameterKey=EcrUser,ParameterValue=${AWS_ECR_USER} ParameterKey=AppName,ParameterValue=${APP_NAME} \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${AWS_PROFILE}

