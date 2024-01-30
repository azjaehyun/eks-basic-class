packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amzn2" {
  ami_name      = "eks-bastion-packer-ubuntu" # modify
  instance_type = "t2.micro"
  region        = "us-west-2"


  subnet_filter {
    filters = {
        "tag:Name": "*default-public*" 
    }
  }
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20231025"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"

  tags = {
    Name        = "jaehyun.yang@bespinglobal.com" # modify your aws account id 
    Environment = "dev"
  }
}


build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.amzn2"  
  ]

  provisioner "shell" {
     script  = "provision-bastion.sh"
  }
}