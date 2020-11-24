terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}







# resource "aws_vpc" "vpc_control_plane" {
#   cidr_block        = "10.1.0.0/16"
#   instance_tenancy  = "default"

#   tags = {
#     Name = "vpc-control-plane"
#   }
# }

# resource "aws_subnet" "subnet_control_plane" {
#   vpc_id      = aws_vpc.vpc_control_plane.id
#   cidr_block  = "10.1.1.0/24"

#   tags = {
#     Name = "subrede-control-plane"
#   }
# }

# resource "aws_vpc" "vpc_worker" {
#   cidr_block       = "10.2.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "vpc-worker"
#   }
# }

# resource "aws_subnet" "subnet_worker" {
#   vpc_id     = aws_vpc.vpc_worker.id
#   cidr_block = "10.2.1.0/24"

#   tags = {
#     Name = "subrede-worker"
#   }
# }




