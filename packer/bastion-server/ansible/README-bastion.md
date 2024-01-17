# ansible bastion 


## [packer document](https://developer.hashicorp.com/packer/tutorials/aws-get-started)

To build the bastion AMI:

```
ssh-keygen [엔터연타~~]
EX)
ssh-keygen -t rsa -b 2048 -m pem -f ~/.ssh/yangjaehyun
aws ec2 import-key-pair --key-name yangjaehyun --public-key-material fileb://~/.ssh/yangjaehyun.pub


packer init bastion-aws-build.pkr.hcl
packer build bastion-aws-build.pkr.hcl
```