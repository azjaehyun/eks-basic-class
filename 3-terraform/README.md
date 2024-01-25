# 사전 작업 
- 2-cloud9  폴더 packer 이미지 생성 후 3-terraform 을 진행합니다.

### terraform을 활용한 aws 2tier infra 생성 , keypair 생성 , bastion 생성 , eks 생성
- 아래의 쉘로 한방에 구축을 진행합니다.
```
./vpc-eks-apply.sh
```

- 위의 쉘 실행후 셋팅 방법입니다.  [ << 부분이 입력하는 부분  ]
  

```
********************** Make AWS credentials Setting ***********************
AWS Access Key ID [****************ZPMM]:   <<  입력
AWS Secret Access Key [****************ESmI]:  <<  입력
Default region name [us-west-2]:  <<  입력
Default output format [json]:  <<  입력
********************** Show AWS credentials  ***********************
/home/ec2-user/.aws/credentials
********************************************************************
********************** Terraform install ***********************
테라폼 cli 설치가 필요하시면 y를 입력해주세요
y <<  y 입력하면 설치 y 아니면 미설치 
********************** Terraform install finish ***********************
********************** keypair Make Start ***********************
ssh-keygen key를 생성합니다. key file 이름을 입력해주세요. 본인 영문명을 넣어주시면 됩니다. EX) yangjaehyun 
yangjaehyun  <<  본인 영문명 입력
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): << 그냥 엔터
Enter same passphrase again: << 그냥 엔터
Your identification has been saved in yangjaehyun-keypair
Your public key has been saved in yangjaehyun-keypair.pub
The key fingerprint is:
SHA256:fS/DPEoI+e/npjXr26H8sggmYx6r3vlHi9VqV681xEY ec2-user@ip-172-31-43-99.us-west-2.compute.internal
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|               E |
|       . .    o  |
|      o S ...  + |
|       o .o+..+  |
|      = =+.oO.oo.|
|     + B.+===O oo|
|   .o.=..+*BO=+. |
+----[SHA256]-----+
 만들어진 공개키는 아래와 같습니다 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2NEASRiSsTxjXAmLbnsmNE2T9eFRGZbywiJxUi3H4WuVJ9UWYH991tAAfHB8K26H32TB6HaNSiXwsC7bpMeKoVNsaduE6uQLezNR56E7GLtO8dus/PTcyb1dEnsAfchM1+cTAqnEs4Pr1NN5uS8od6SsgwXGYcEWE71vTIdBxS5uFBfRHG+SBPX+u+ov5TS8Zd/vevg9NRZde4L67XzA8j9Q8Kfr1Sgs7q2YMuCNqM49oiCZ6iF8H4d3+QhaZmTTnFbBafFBlynXLW9VG/iWjfJAqYufpvu1+HZo2Tffc+Nc938MZ7WUpYeiwffi6ml/hUUdsOqAayXbEsVZztMjt ec2-user@ip-172-31-43-99.us-west-2.compute.internal
 만들어진 개인키는 아래와 같습니다 
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAtjRAEkYkrE8Y1wJi257JjRNk/XhURmW8sIicVItx+FrlSfVF
mB/fdbQAHxwfCtuh99kweh2jUol8LAu26THiqFTbGnbhOrkC3szUeehOxi7TvHbr
Pz03Mm9XRJ7AH3ITNfnEwKpxLOD69TTebkvKHekrIMFxmHBFhO9b0yHQcUubhQX0
RxvkgT1/rvqL+U0vGXf73r4PTUWXXuC+u18wPI/UPCn69UoLO6tmDLgjajOPaIgm
eohfB+Hd/kIWmZk05xWwWnxQZcp1y1vVRv4lo3yQKmLn6b7tfh2aNk333PjXPd/D
Ge1lKWHosH34uppf4VFHbDqgGsl2xLFWc7TI7QIDAQABAoIBAA/HNg4vD1Fxlw3V
edCZb0w9c/ckMq4W9NBXwCvtGG1Al88AA6sRBYWYlRMcmQ6UZvIC15kXlHNbDwr0
Z75JcN6RXJjt1wLCDz7Sf4rgBGRSnUjahnQnPa6rKCQ72BjRBNtdef2SNPNFN05B
Kgrkmsfcz3yKa+cev9JrdOjzamzJESqvtPtEf9VR8cEbm2rAdzJiUKR7rdsYr6b5
MdVFYS5H5kUVSui0wH3wA3LDJ3x99lsMf7o2WkNx0HPRy1Of9BBqh52cl05VL+kd
ufsSNZogBU2xC02UCAnN/5vu+xIkvCKH14SxY+Euzm1rMtBtvNjADaSomEAf/0B/
6+fubokCgYEA4PCKyk+qVCo24lfywH4eP9XxX4PBBZdGVRx/XdM2zxc2NB4YH7Ct
wKZQjxTuvNEZ4iypHleYJSYdDp7LnCGQPN/JCOYmzn0CxFhWdeAplxEmSLAqYnUm
GT16VEFhkC/IjuRvcRZjA9EroO44cnqIkQgIr5lKn92Bx90F/6GfYmUCgYEAz10J
oWQ76hc6+1fNtKmvEQ56ZYNVnXNB+U0LSX9ON1LK/cBgl9e5NT//q4cRcERjt6F7
3yKKQp6WhcAYi50XC5yAbPFaaqu3F/pLTBT7+T+jEVlvHRqAPWsSVVpbOWa3RHgo
j/fiXERBK0BsDw667bbtTIpKl+2bnMtPnbEyH+kCgYA/QaXmKu0dahmxIUZ094KO
NR4B3E1lwxrWSINQ4VridgaaNXRXRRo3uQ2ijyJsGumKf0C39a4llEhLmkBsEcw8
MjqYtBBptSIYETePQpCvmPUJL/FbatJh+rXyB8jmAWoHNRpZ1Q/XPPVl9lgNaYQK
NRYsO5GOz331tKRBNTRbOQKBgH8tLnTfRqfBa5kvNqgw0YACgyqzK9UPFU1S5TNE
crIXgwux6wv1cE+qWqHWiulx6D59Ob2WL3nATczmDafCxpmGeHVYaP23Jun7xiZ5
UDiDwP0o/q64zCHfAzV53y0LRCcoEqiJfTjdW6KtNhjeDeMxJ8SjpDAduCynvMKY
JIfRAoGBAJsrSt8z9nVOpJQDxENfP4jIxSjgYjV/3swxH0QZcLNK6Es725HV9x/a
mLCGi8/VG4KM9SVXJSCUb05LFKiqmuUiwHNLlPyt0FKKAEDXpWE9uKhX2076PrvS
YtUAmtx2MwfFNqb/1h8cQZPEOJXF1o7xCxUX9PQT4IWZIkikcv8b//CNE
-----END RSA PRIVATE KEY-----
 생성된 개인키와 공개키는 테라폼 구성을 위해 ./arch/terraform-middle/dev/10-pre-requisite/template/ 경로로 복사합니다
********************** keypair Make Finish ***********************
********************** terraform tfvars owner 변수를 변경합니다 ****************************
********************** 본인의 이름을 영어로 입력하세요 ex) yang.jaehyun **************************



```