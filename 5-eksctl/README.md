# eksctl 명령어를 통한 eks 설치 
- 테라폼을 이용하면 eks가 생성되니 eks가 생성되어 있는 분들은 패스하셔도 됩니다.
- [공식 도큐먼트](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/getting-started-eksctl.html)
- [공식 도큐먼트 yaml 방식 Detail](https://catalog.us-east-1.prod.workshops.aws/workshops/9c0aa9ab-90a9-44a6-abe1-8dff360ae428/ko-KR/50-eks-cluster/100-launch-cluster)  
- eksctl 명령어 가이드()

## 사전준비 - subent tag 설정 
eks 셋팅시 subnet 셋팅 주의점!!   
쿠버네티스가 지정된 subnet만 사용하도록 태그 지정해줘야함
- public subnet은 
  * "kubernetes.io/role/elb" = 1  << 태그 추가 
- private subnet은
  * "kubernetes.io/role/internal-elb" = 1 << 태그 추가 

## eksctl 생성 명령어
```
eksctl create cluster --name {my-cluster} --region {region-code}
```

## eksctl 생성 로그
```
ubuntu@ip-10-0-11-206:~$ eksctl create cluster --name jh-cluster --region us-west-2  << 시작

2024-02-19 07:10:31 [ℹ]  eksctl version 0.171.0
2024-02-19 07:10:31 [ℹ]  using region us-west-2
2024-02-19 07:10:31 [ℹ]  setting availability zones to [us-west-2a us-west-2d us-west-2b]
2024-02-19 07:10:31 [ℹ]  subnets for us-west-2a - public:192.168.0.0/19 private:192.168.96.0/19
2024-02-19 07:10:31 [ℹ]  subnets for us-west-2d - public:192.168.32.0/19 private:192.168.128.0/19
2024-02-19 07:10:31 [ℹ]  subnets for us-west-2b - public:192.168.64.0/19 private:192.168.160.0/19
2024-02-19 07:10:31 [ℹ]  nodegroup "ng-108158a2" will use "" [AmazonLinux2/1.27]
2024-02-19 07:10:31 [ℹ]  using Kubernetes version 1.27
2024-02-19 07:10:31 [ℹ]  creating EKS cluster "jh-cluster" in "us-west-2" region with managed nodes
2024-02-19 07:10:31 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2024-02-19 07:10:31 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-west-2 --cluster=jh-cluster'
2024-02-19 07:10:31 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "jh-cluster" in "us-west-2"
2024-02-19 07:10:31 [ℹ]  CloudWatch logging will not be enabled for cluster "jh-cluster" in "us-west-2"
2024-02-19 07:10:31 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-west-2 --cluster=jh-cluster'
2024-02-19 07:10:31 [ℹ]
2 sequential tasks: { create cluster control plane "jh-cluster",
    2 sequential sub-tasks: {
        wait for control plane to become ready,
        create managed nodegroup "ng-108158a2",
    }
}
2024-02-19 07:10:31 [ℹ]  building cluster stack "eksctl-jh-cluster-cluster"
2024-02-19 07:10:32 [ℹ]  deploying stack "eksctl-jh-cluster-cluster"
2024-02-19 07:11:02 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:11:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:12:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:13:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:14:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:15:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:16:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:17:32 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-cluster"
2024-02-19 07:19:34 [ℹ]  building managed nodegroup stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:19:34 [ℹ]  deploying stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:19:34 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:20:04 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:20:44 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:22:30 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:22:30 [ℹ]  waiting for the control plane to become ready
2024-02-19 07:22:34 [✔]  saved kubeconfig as "/home/ubuntu/.kube/config"
2024-02-19 07:22:34 [ℹ]  no tasks
2024-02-19 07:22:34 [✔]  all EKS cluster resources for "jh-cluster" have been created
2024-02-19 07:22:34 [ℹ]  nodegroup "ng-108158a2" has 2 node(s)
2024-02-19 07:22:34 [ℹ]  node "ip-192-168-32-129.us-west-2.compute.internal" is ready
2024-02-19 07:22:34 [ℹ]  node "ip-192-168-6-95.us-west-2.compute.internal" is ready
2024-02-19 07:22:34 [ℹ]  waiting for at least 2 node(s) to become ready in "ng-108158a2"
2024-02-19 07:22:34 [ℹ]  nodegroup "ng-108158a2" has 2 node(s)
2024-02-19 07:22:34 [ℹ]  node "ip-192-168-32-129.us-west-2.compute.internal" is ready
2024-02-19 07:22:34 [ℹ]  node "ip-192-168-6-95.us-west-2.compute.internal" is ready
2024-02-19 07:22:34 [ℹ]  kubectl command should work with "/home/ubuntu/.kube/config", try 'kubectl get nodes'
2024-02-19 07:22:34 [✔]  EKS cluster "jh-cluster" in "us-west-2" region is ready

ubuntu@ip-10-0-11-206:~$ kubectl get nodes
NAME                                           STATUS   ROLES    AGE    VERSION
ip-192-168-32-129.us-west-2.compute.internal   Ready    <none>   100s   v1.27.9-eks-5e0fdde
ip-192-168-6-95.us-west-2.compute.internal     Ready    <none>   99s    v1.27.9-eks-5e0fdde
```


## eksctl 삭제 명령어
```
eksctl delete cluster --name {my-cluster}
```

## eksctl 삭제 로그
```

ubuntu@ip-10-0-11-206:~$ eksctl delete cluster --name jh-cluster
2024-02-19 07:24:46 [ℹ]  deleting EKS cluster "jh-cluster"
2024-02-19 07:24:47 [ℹ]  will drain 0 unmanaged nodegroup(s) in cluster "jh-cluster"
2024-02-19 07:24:47 [ℹ]  starting parallel draining, max in-flight of 1
2024-02-19 07:24:47 [ℹ]  deleted 0 Fargate profile(s)
2024-02-19 07:24:47 [✔]  kubeconfig has been updated
2024-02-19 07:24:47 [ℹ]  cleaning up AWS load balancers created by Kubernetes objects of Kind Service or Ingress
2024-02-19 07:24:48 [ℹ]
2 sequential tasks: { delete nodegroup "ng-108158a2", delete cluster control plane "jh-cluster" [async]
}
2024-02-19 07:24:48 [ℹ]  will delete stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:24:48 [ℹ]  waiting for stack "eksctl-jh-cluster-nodegroup-ng-108158a2" to get deleted
2024-02-19 07:24:48 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:25:18 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:25:51 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:26:27 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:27:46 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:28:46 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:30:09 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:31:40 [ℹ]  waiting for CloudFormation stack "eksctl-jh-cluster-nodegroup-ng-108158a2"
2024-02-19 07:31:40 [ℹ]  will delete stack "eksctl-jh-cluster-cluster"
2024-02-19 07:31:40 [✔]  all cluster resources were deleted
```


   
## .kube/config file 생성 가이드 ( 해당 방법은 수동으로 aws ui 화면에서 eks를 생성했을때 사용한다 )
```
aws eks --region {my-region} update-kubeconfig --name {my-cluster-name}
```

## eks aws-auth 확인
```
kubectl describe  configmap aws-auth -n kube-system 
```

## [eksctl cluster yaml file](https://eksctl.io/usage/nodegroup-managed/)
```
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: flux-cluster
  region: us-east-2
  version: "1.23"

availabilityZones: ["us-east-2b", "us-east-2c"]
managedNodeGroups:
  - name: workers
    instanceType: hpc6a.48xlarge
    minSize: 64
    maxSize: 64
    labels: { "fluxoperator": "true" }
    availabilityZones: ["us-east-2b"]   
    efaEnabled: true
    placement:
      groupName: eks-efa-testing
```

## eksctl create - cluster yaml file  
```
eksctl create nodegroup --config-file=YOUR_CLUSTER.yaml
```


## 참고 사이트
```
https://awskocaptain.gitbook.io/aws-builders-eks/4.-eksctl
```



