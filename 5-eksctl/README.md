# eks-basic-class
eks-basic-class - EKS를 처음 접하는 분

## eksctl
```
https://awskocaptain.gitbook.io/aws-builders-eks/4.-eksctl
kubectl -n kube-system describe serviceaccounts aws-load-balancer-controller     
```

### policy
```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json

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


eksctl delete iamserviceaccount \
  --cluster=eks-init-uw2d-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller


```