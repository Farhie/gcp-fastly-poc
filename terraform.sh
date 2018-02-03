#!/usr/bin/env bash
set -e

if [ "$#" -ne 3 ]
then
printf "Three arguments required.\n1. Desired Terraform action [plan|apply|destroy].\n2. The project name.\n3. The chosen region"
exit 1
fi

TERRAFORM_ACTION=$1
PROJECT_NAME=$2
REGION=$3

export GOOGLE_APPLICATION_CREDENTIALS=~/.google_cloud/account.json
cd environment-infrastructure
terraform init
terraform ${TERRAFORM_ACTION} -var "region=${PROJECT_NAME}" -var "project=${PROJECT_NAME}" -var-file=../variables/environment.tfvars
