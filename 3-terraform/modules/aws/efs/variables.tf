

variable "nfs_name" {
  type = string
  description = " AWS NFS 생성시 사용할 이름을 입력해주세요." 
}


variable "vpc_id" {
  type = string
  description = " AWS NFS 생성시 사용할 이름을 입력해주세요." 
}

variable "nfs_service_ports" {
  type    = list(string)

}


variable "private_subnet_1_id" {
  type = string
}

variable "private_subnet_2_id" {
  type = string
}


variable "tag_name" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}