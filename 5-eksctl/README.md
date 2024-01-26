# eksctl 명령어를 통한 eks 설치 
- 테라폼을 이용하면 eks가 생성되니 eks가 생성되어 있는 분들은 패스하셔도 됩니다.
- [공식 도큐먼트](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/getting-started-eksctl.html)
- [공식 도큐먼트 yaml 방식 Detail](https://catalog.us-east-1.prod.workshops.aws/workshops/9c0aa9ab-90a9-44a6-abe1-8dff360ae428/ko-KR/50-eks-cluster/100-launch-cluster)  

## eksctl 생성 명령어
```
eksctl create cluster --name {my-cluster} --region {region-code}
```
  

## 참고 사이트
```
https://awskocaptain.gitbook.io/aws-builders-eks/4.-eksctl
```