!/bin/bash
# echo "********************** Make AWS credentials Setting ***********************"
# aws configure

# echo "********************** Show AWS credentials  ***********************"
# echo ~/.aws/credentials
# echo "********************************************************************"


# echo "********************** Terraform install ***********************"
# echo "테라폼 cli 설치가 필요하시면 y를 입력해주세요"
# read terra_y_value
# if [ "$terra_y_value" == "y" ]; then
#     echo "terraform cli 설치를 시작합니다."
#     wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
#     unzip terraform_0.14.7_linux_amd64.zip
#     sudo mv terraform /usr/local/bin/
#     terraform --version
# else
#     echo "설치는 pass"
# fi

# echo "********************** Terraform install finish ***********************"


# echo "********************** keypair Make Start ***********************"
# echo "ssh-keygen key를 생성합니다. key file 이름을 입력해주세요. EX) jaehyun.ynag "
# read kegen_y_value
# ssh-keygen -t rsa -b 2048 -m pem -f ${kegen_y_value}-keypair

# echo  " 만들어진 공개키는 아래와 같습니다 "
# cat ${kegen_y_value}-keypair.pub
# echo  " 만들어진 개인키는 아래와 같습니다 "
# cat ${kegen_y_value}-keypair

# echo " 생성된 개인키와 공개키는 테라폼 구성을 위해 ./arch/terraform-middle/dev/10-pre-requisite/template/ 경로로 복사합니다"
# cp ${kegen_y_value}-keypair ./arch/terraform-middle/dev/10-pre-requisite/template/
# cp ${kegen_y_value}-keypair.pub ./arch/terraform-middle/dev/10-pre-requisite/template/

# rm ${kegen_y_value}-keypair
# rm ${kegen_y_value}-keypair.pub
# echo "********************** keypair Make Finish ***********************"


echo "********************** terraform tfvars owner 변수를 변경합니다 ****************************"
echo "********************** 본인의 이름을 영어로 입력하세요 ex) yang.jaehyun ****************************"
read tfvar_y_value
find . -type f -name "*.tfvars" -exec sed -i "s/jaehyun.yang/$tfvar_y_value/g"  {} \;
echo "********************** terraform tfvars setting  **********************"

echo "********************** 10-pre-requisite Start ***********************"
cat ./arch/terraform-middle/dev/10-pre-requisite/terraform.tfvars
echo "테라폼 벨류 설정 파일이 맞으면 y를 눌러주세요"
read y_value

if [ "$y_value" == "y" ]; then
    echo "10-pre-requisite keypair 등록을 실행합니다."
    terraform -chdir=arch/terraform-middle/dev/10-pre-requisite init
    terraform -chdir=arch/terraform-middle/dev/10-pre-requisite apply --auto-approve
else
    echo ""
    # 추가로 실행할 명령어를 여기에 추가하세요
fi
echo "********************** 10-pre-requisite End ***********************"


# echo "********************** VPC Make Starting ***********************"
# cat ./arch/terraform-middle/dev/20-vpc-subnet-eks-bastion/terraform.tfvars
# echo "테라폼 벨류 설정 파일이 맞으면 y를 눌러주세요"
# read y_value

# if [ "$y_value" == "y" ]; then
#     echo "VPC 및 bastion 서버 생성을 실행합니다."
#     terraform -chdir=arch/terraform-middle/dev/20-vpc-subnet-eks-bastion init
#     terraform -chdir=arch/terraform-middle/dev/20-vpc-subnet-eks-bastion apply --auto-approve
# else
#     echo ""
#     # 추가로 실행할 명령어를 여기에 추가하세요
# fi
# echo "********************** VPC Make End ***********************"



# echo "********************** EKS Make Starting ***********************"
# cat ./arch/terraform-middle/dev/40-eks-getting-started/terraform.tfvars
# echo "테라폼 벨류 설정 파일이 맞으면 y를 눌러주세요"
# read y_value

# if [ "$y_value" == "y" ]; then
#     echo "EKS를 생성합니다."
#     terraform -chdir=arch/terraform-middle/dev/40-eks-getting-started init
#     terraform -chdir=arch/terraform-middle/dev/40-eks-getting-started apply --auto-approve
# else
#     exit 0
#     # 추가로 실행할 명령어를 여기에 추가하세요
# fi
# echo "********************** EKS Make End ***********************"

