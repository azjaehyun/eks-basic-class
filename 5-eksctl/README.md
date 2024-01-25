# eks-basic-class
eks-basic-class - EKS를 처음 접하는 분



## eksctl
```
eksctl create cluster --name my-cluster --region region-code
https://awskocaptain.gitbook.io/aws-builders-eks/4.-eksctl
kubectl -n kube-system describe serviceaccounts aws-load-balancer-controller     
```

### policy
```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
165~166 라인 삭제~




aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json

eksctl utils associate-iam-oidc-provider --region=us-west-2 --cluster=eks-init-uw2d-eks --approve

eksctl create iamserviceaccount \
  --cluster=eks-init-uw2d-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::767404772322:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve \
  --override-existing-serviceaccounts

checking
kubectl get serviceaccounts -n kube-system aws-load-balancer-controller -o yaml


curl -Lo v2_5_4_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml


eksctl delete iamserviceaccount \
  --cluster=eks-init-uw2d-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller


```