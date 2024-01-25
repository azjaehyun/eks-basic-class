context = {
    aws_credentials_file    = "$HOME/.aws/credentials"
    aws_profile             = "default"
    aws_region              = "us-west-2"
    region_alias            = "uw2"

    project                 = "eks-init"
    environment             = "dev"
    env_alias               = "d"
    owner                   = "yang.jaehyun"
    team_name               = "Devops CNE Team"
    team                    = "CNE"
    generator_date          = "20240108"
    domain                  = "terraform.prac.dev"
    pri_domain              = "terraform.prac"
}

# vpc prefix ip
vpc_cidr = "40.40"

