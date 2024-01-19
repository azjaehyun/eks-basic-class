
scp -i yangjaehyun-keypair yangjaehyun-keypair  ubuntu@35.92.203.68:~/.ssh
terraform -chdir=arch/terraform-middle/dev/40-eks-getting-started output > eks-output.txt         
sco -i yangjaehyun-keypair eks-output.txt  ubuntu@35.92.203.68:~/.ssh