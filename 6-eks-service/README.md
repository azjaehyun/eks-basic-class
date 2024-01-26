### eks-basic-class
해당 챕터에서는 eks service에 필요한 lib를 설치하고 실습합니다.
---

- eks service를 진행하면서 필요한 lib를 설치하고 셋팅합니다.
  * 설치 목록
  * aws-load-balancer-controller policy 생성
  * aws-load-balancer-controller policy serviceaccount 생성
  * oidc-provider 설치
  * cert manager 설치
- 실습 - k8s Service 종류 실습
  * clb 
  * alb
  * ingress 
  * NodePort
  * CluserIP

### aws-load-balancer-controller 설치 document 참고하세요.
```
- https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html
- https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/aws-load-balancer-controller.html
```
---


### aws-load-balancer-controller policy 생성

-  policy 다운로드
```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
```
  
- 다운로드후 165~166 라인 삭제 후 아래 명령어 실행.
```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```
  

### aws-load-balancer-controller serviceaccount 생성
```
eksctl create iamserviceaccount \
  --cluster=eks-init-uw2d-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::767404772322:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve \
  --override-existing-serviceaccounts
```


### aws-load-balancer-controller serviceacount checking 명령어
```
kubectl get serviceaccounts -n kube-system aws-load-balancer-controller -o yaml
```

### aws-load-balancer-controller serviceacount delete 명령어
```
eksctl delete iamserviceaccount \
  --cluster=eks-init-uw2d-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller
```

### eks에 aws-load-balancer-controller를 설치하자!!   
- [ingress controller yaml down](https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml)
- wget https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml 
- 해당 파일은 aws-load-balancer-yaml 폴더 안에 있습니다.
- download 후 863 line에 본인의 클러스터 이름으로 수정!! EX) - --cluster-name=yangjaehyun-cluster
- 596 ~ 603 line 인 serviceaccount는 삭제!! 왜냐면 위에서 serviceacount 를 생성했기 때문


### oidc-provider 설치
```
eksctl utils associate-iam-oidc-provider --region=us-west-2 --cluster=eks-init-uw2d-eks --approve
```

###  [cert manager 설치](https://cert-manager.io/docs/installation/)
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.yaml
```
