# 인증/자격증명 및 환경 구성
1. 역할 ( role ) 만들기
- 역할생성 -> AWS service -> EC2 -> AdministratorAccess 선택 -> ekswork-admin 이름으로 생성
- 생성후 cloud9 ec2 역할 ekswork-admin 로 변경 

2. 기존자격 증명 파일 제거
- cloud9 -> 오른쪽 위 톱니바퀴 -> aws setting 탭 -> Cloud9 설정환경에서 "AWS managed temporary credential"을 비활성합니다.
- rm -vf ${HOME}/.aws/credentials 제거

3. cloud9 IDE 역할 체크
```
aws sts get-caller-identity --region us-west-2 --query Arn | grep ekswork-admin -q && echo "IAM role valid" || echo "IAM role NOT valid"
aws sts get-caller-identity --region us-west-2
```


4. shell 환경변수 저장
```
# Account , Region 정보를 AWS Cli로 추출합니다.
export ACCOUNT_ID=$(aws sts get-caller-identity --region us-west-2 --output text --query Account)
export AWS_REGION=$(curl -s {your_cloud9_public_ip}/latest/dynamic/instance-identity/document | jq -r '.region')
echo $ACCOUNT_ID
echo $AWS_REGION
# bash_profile에 Account 정보, Region 정보를 저장합니다.
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure --profile default list
```


terraform/arch/terraform-middle/dev/20-vpc-subnet-eks-bastion