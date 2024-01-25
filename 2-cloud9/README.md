# cloud9 IDE 환경 구성



### 1. Cloud9 구성 설정 및 생성!
- 리전 오레곤 선택 ( us-west-2 선택!! 이유는 가격이 젤쌈 ^^)
- service에서 cloud9 검색 -> 오른쪽 주황색 환경 생성 버튼 클릭
- 세부 정보 이름 , 설명 본인이 작성 
- Instance Type - 추가 인스턴스 유형 - t2.micro
- 플랫폼 - Amazone Linux 2023
- 시간제한 setting - Never(안함)
- 네트워크 설정 - Aws systems Manager(SSM)
- VPC - default 선택
- subnet - us-west-2a로 선택  

---

### 2. cloud9 생성후 접속 후 환경 셋팅하자 !!!
- 오른쪽 상단위 톱니바퀴 클릭 -> AWS settings 클릭 -> Credentials [Aws managed temporary credentails] 비활성화 ( 녹색 -> 빨간색으로 버튼 클릭~)  


---
### 3. 왼쪽 깃 sourcec control 클릭 후
-  Clone Repository 클릭 후 https://github.com/azjaehyun/eks-basic-class.git 입력후 엔터!
-  /home/ec2-user/environment 기본 경로로 설정후 녹색버튼 클릭
- 화면 아래 bash 탭에 접속후 ls 치면 eks-basic-class 폴더로 깃이 다운로드 되어 있는것을 확인
- 왼쪽 탭에 폴더 모양을 누르면 Hierarchy 구조로  eks-basic-class 폴더를 볼 수 있음.  


---
### 4. aws configure 설정
- aws configure 명령어 친 후에 본인 억세스키와 시크릿키 리전 입력
- [EX] aws configure
```
AWS Access Key ID [None]: abcdedfeg.... [<<본인 억세스키 입력]
AWS Secret Access Key [None]: abdkljalkfjlke [<<본인 스키릿키 입력]
Default region name [None]: us-west-2
Default output format [None]: json
```
- 확인 명령어 : aws configure list

--- 
### 5. packer 로 bastion AMI 를 생성하자.
- packer install 및 버전 확인
```
cd ~
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer
packer --version 
```
- 

  


