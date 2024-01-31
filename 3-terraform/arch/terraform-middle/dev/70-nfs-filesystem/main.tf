
module "aws_nfs_file_system" {
  nfs_name = "nfs_name"
  nfs_service_ports = ["2049","2049"]
  source     = "../../../../modules/aws/efs"
  vpc_id     = data.aws_vpc.this.id
  private_subnet_1_id = data.aws_subnets.private[0]
  private_subnet_2_id = data.aws_subnets.private[1]
  #availability_zone = "${var.context.aws_region}a"
  
}



