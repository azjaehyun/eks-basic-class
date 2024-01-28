

## [EFS(NAS storage) install](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/efs-csi.html)


- policy.json 다운로드
```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-efs-csi-driver/master/docs/iam-policy-example.json
```
  

- policy 생성 
```
aws iam create-policy \
--policy-name AmazonEKS_EFS_CSI_Driver_Policy \
--policy-document file://iam-policy-example.json
```

- 아래 명령어 실행 
```
eksctl create iamserviceaccount \
  --name efs-csi-controller-sa \
  --namespace kube-system \
  --cluster eks-basic-uw2d-k8s \
  --attach-policy-arn arn:aws:iam::767404772322:policy/AmazonEKS_EFS_CSI_Driver_Policy \
  --approve \
  --override-existing-serviceaccounts
```  
---

- 실행 결과 확인
```
ubuntu@ip-40-40-11-188:~/nas$ eksctl create iamserviceaccount \
>   --name efs-csi-controller-sa \
>   --namespace kube-system \
>   --cluster eks-basic-uw2d-k8s \
>   --attach-policy-arn arn:aws:iam::767404772322:policy/AmazonEKS_EFS_CSI_Driver_Policy \
>   --approve
2024-01-26 06:32:30 [ℹ]  1 existing iamserviceaccount(s) (kube-system/aws-load-balancer-controller) will be excluded
2024-01-26 06:32:30 [ℹ]  1 iamserviceaccount (kube-system/efs-csi-controller-sa) was included (based on the include/exclude rules)
2024-01-26 06:32:30 [!]  serviceaccounts that exist in Kubernetes will be excluded, use --override-existing-serviceaccounts to override
2024-01-26 06:32:30 [ℹ]  1 task: {
    2 sequential sub-tasks: {
        create IAM role for serviceaccount "kube-system/efs-csi-controller-sa",
        create serviceaccount "kube-system/efs-csi-controller-sa",
    } }2024-01-26 06:32:30 [ℹ]  building iamserviceaccount stack "eksctl-eks-basic-uw2d-k8s-addon-iamserviceaccount-kube-system-efs-csi-controller-sa"
2024-01-26 06:32:31 [ℹ]  deploying stack "eksctl-eks-basic-uw2d-k8s-addon-iamserviceaccount-kube-system-efs-csi-controller-sa"
2024-01-26 06:32:31 [ℹ]  waiting for CloudFormation stack "eksctl-eks-basic-uw2d-k8s-addon-iamserviceaccount-kube-system-efs-csi-controller-sa"
2024-01-26 06:33:01 [ℹ]  waiting for CloudFormation stack "eksctl-eks-basic-uw2d-k8s-addon-iamserviceaccount-kube-system-efs-csi-controller-sa"
2024-01-26 06:33:01 [ℹ]  created serviceaccount "kube-system/efs-csi-controller-sa"
````



helm upgrade -i aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver \
    --namespace kube-system \
    --set image.repository=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/aws-efs-csi-driver \
    --set controller.serviceAccount.create=false \
    --set controller.serviceAccount.name=efs-csi-controller-sa

### 참고 문헌
```
https://kschoi728.tistory.com/94
```


# efs 사용하기
EBS와 EFS의 차이점  

EBS	
- 하나의 AZ만 접근 가능
- 처음 설정한 크기
- GB당 0.116$  

EFS
- 여러 AZ에서 접근 가능
- 사용한 만큼 확장
- GB당 0.33$


