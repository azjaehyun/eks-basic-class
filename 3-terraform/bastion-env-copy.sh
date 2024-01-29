#!/bin/bash
echo "********************** bastion에 env 파일을 복사합니다. ***********************"
echo "********************** 복사대상은 ssh private key , terraform tfstate file 을 복사합니다. ***********************"
echo "********************** 복사를 위해 bastion public ip를 입력해주세요. ***********************"
read bastion_public_ip

echo "********************** bastion에 ssh private key  파일을 복사합니다. ***********************"
scp -i yangjaehyun-keypair yangjaehyun-keypair  ubuntu@${bastion_public_ip}:~/.ssh
echo "********************** bastion에 10-pre-requisite terraform.tfstate 파일을 복사합니다. ***********************"
scp -i yangjaehyun-keypair ./arch/terraform-middle/dev/10-pre-requisite/terraform.tfstate ubuntu@${bastion_public_ip}:~/.ssh
echo "********************** bastion에 20-vpc-subnet-eks-bastion terraform.tfstate 파일을 복사합니다. ***********************"
scp -i yangjaehyun-keypair ./arch/terraform-middle/dev/20-vpc-subnet-eks-bastion/terraform.tfstate ubuntu@${bastion_public_ip}:~/.ssh
echo "********************** bastion에 40-eks-getting-started terraform.tfstate  파일을 복사합니다. ***********************"
scp -i yangjaehyun-keypair ./arch/terraform-middle/dev/40-eks-getting-started/terraform.tfstate ubuntu@${bastion_public_ip}:~/.ssh

