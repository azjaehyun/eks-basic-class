# ansible bastion 

## [packer document](https://developer.hashicorp.com/packer/tutorials/aws-get-started)

To build the bastion AMI:


### pakcer 변수 수정
- vi bastion-aws-build.pkr.hcl 입력후 11번 라인 ami_name 이름인 eks-bastion-packer-ubuntu 이름 수정
- 본인 이름앞에 프리픽스로 넣어서 수정하기 EX) yangjaehyun-eks-bastion-packer-ubuntu
- 수정 완료후 아래 명령어 실행
```
packer init bastion-aws-build.pkr.hcl
packer build bastion-aws-build.pkr.hcl
```