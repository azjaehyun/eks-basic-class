# cloud9 IDE 환경 구성

1. Cloud9 구성 설정 
- 리전 오레곤 선택 ( us-west-2 선택!! 이유는 가격이 젤쌈 ^^)
- service에서 cloud9 검색 -> 오른쪽 주황색 환경 생성 버튼 클릭
- 세부 정보 이름 , 설명 본인이 작성 
- Instance Type - 추가 인스턴스 유형 - t3.large
- 플랫폼 - Amazone Linux 2023
- 시간제한 setting - Never(안함)
- 네트워크 설정 - Aws systems Manager(SSM)
- VPC - default 선택
- subnet - us-west-2a로 선택

2. AWS CLI command
```
# AWS CLI Upgrade
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
source ~/.bashrc
aws --version
# AWS CLI 자동완성 설치 
which aws_completer
export PATH=/usr/local/bin:$PATH
source ~/.bash_profile
complete -C '/usr/local/bin/aws_completer' aws
```

3. kubectl install
```
cd ~
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
kubectl version --short --client

```

4. etc util
```
sudo yum -y install jq gettext bash-completion moreutils
for command in kubectl jq envsubst aws
  do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
  done
```

5. k9s install
```
K9S_VERSION=v0.26.7
curl -sL https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_x86_64.tar.gz | sudo tar xfz - -C /usr/local/bin 

```

5. k9s checking
```
k9s
k9s 단춬키는 ? 입력후 엔터
```