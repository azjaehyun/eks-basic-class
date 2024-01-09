#!/bin/bash
echo "********************** ENV setting ***********************"
echo "*************** insert access_key ***********************************"
read access_key
echo "*************** insert secret_key ***********************************"
read secret_key

echo "********************** Make AWS credentials Setting ***********************"

aws configure



# cat <<EOF > ~/.aws/credentials-sh
# [eks-start-profile]
# aws_access_key_id = ${access_key}
# aws_secret_access_key = ${secret_key}
# EOF
echo "********************** Show AWS credentials  ***********************"
echo ~/.aws/credentials

echo "********************************************************************"


echo "********************** Terraform install ***********************"
echo "테라폼 cli 설치가 필요하시면 y를 입력해주세요"
read terra_y_value
if [ "$terra_y_value" == "y" ]; then
    echo "terraform cli 설치를 시작합니다."
    curl -sO https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_darwin_amd64.zip
    unzip terraform_0.12.24_darwin_amd64.zip
    mv terraform /usr/local/bin
    terraform --version
else
    echo "설치는 pass"
fi

echo "********************** Terraform install finish ***********************"


echo "********************** VPC Make Starting ***********************"
cd arch/terraform-middle/dev/20-vpc-subnet-eks-bastion   
pwd
cat terraform.tfvars
echo "테라폼 벨류 설정 파일이 맞으면 y를 눌러주세요"
read y_value

if [ "$y_value" == "y" ]; then
    echo "VPC 및 bastion 서버 생성을 실행합니다."
else
    echo ""
    # 추가로 실행할 명령어를 여기에 추가하세요
fi
terraform init
terraform apply
echo "********************** VPC Make End ***********************"



echo "********************** EKS Make Starting ***********************"
cd arch/terraform-middle/dev/40-eks-getting-started
pwd
cat terraform.tfvars
echo "테라폼 벨류 설정 파일이 맞으면 y를 눌러주세요"
read y_value

if [ "$y_value" == "y" ]; then
    echo "EKS를 생성합니다."
else
    exit 0
    # 추가로 실행할 명령어를 여기에 추가하세요
fi
terraform init
terraform apply
echo "********************** EKS Make End ***********************"

