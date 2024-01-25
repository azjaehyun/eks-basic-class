### eks-basic-class
eks-basic-class - EKS를 처음 접하는 분

### aws-load-balancer-controller 설치
```
https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html
https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/aws-load-balancer-controller.html
```
### [ingress controller yaml down](https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/main/docs/install/v2_2_4_full.yaml)
wget https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/v2_2_4_full.yaml


### [cert manager install](https://cert-manager.io/docs/installation/)
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.yaml
```

### 마리오 - CLB
https://devocean.sk.com/blog/techBoardDetail.do?ID=163578#none


### 테트리스 - ALB



### vimrc settting
```
ubuntu@ip-40-40-11-173:~$ cat .vimrc 
set tabstop=2
set expandtab
set shiftwidth=2
```


### tls
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -out ingress-tls.crt \
 -keyout ingress-tls.key \
 -subj "/CN=ingress-tls" 

kubectl create secret tls ingress-tls \
--namespace default \
--key ingress-tls.key \
--cert ingress-tls.crt
```

### tls ingress 
```
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: http-go-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /welcome/test
    nginx.ingress.kubernetes.io/ssl-redirect: "true" # 리다이렉트 설정
spec:
  tls:
  - hosts:
    - gasbugs.com
    secretName: ingress-tls
  rules:
    - host: gasbugs.com
      http:
        paths:
          - pathType: Exact
            path: /welcome/test
            backend:
              service:
                name: http-go
                port:
                  number: 80
EOF

```

## sample
```
kubectl create deploy http-go --image=gasbugs/http-go
kubectl expose deploy http-go --port=80 --target-port=8080

kubectl create deploy tomcat --image=consol/tomcat07.0
kubectl expose deploy tomcat --port=80 --target-port=8080

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -out gasbugs-tls.crt \
 -keyout gasbugs-tls.key \
 -subj "/CN=gasbugs-tls" 

kubectl create secret tls gasbugs-tls \
--namespace default \
--key gasbugs-tls.key \
--cert gasbugs-tls.crt


cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: http-go-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  tls:
  - hosts:
    - tomcat.gasbugs.com
    - http-go.gasbugs.com
    secretName: gasbugs-tls
  rules:
    - host: tomcat.gasbugs.com
      http:
        paths:
          - pathType: Prefix
            path: /
            backend:
              service:
                name: tomcat
                port:
                  number: 80
    - host: http-go.gasbugs.com
      http:
        paths:
          - pathType: Prefix
            path: /
            backend:
              service:
                name: http-go
                port:
                  number: 80
EOF
```