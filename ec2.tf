provider "aws" {
  profile = "souunit"
  region  = "us-east-1"
  #shared_credentials_file = "C:/Users/T-Gamer/.aws/credentials"
}

resource "aws_instance" "server01" {
  ami                     = var.ubuntu_ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [aws_security_group.control_plane_sg.id, aws_security_group.ssh_sg.id]
  subnet_id               = aws_subnet.subnet_default.id

  tags = {
    Name = "server_01"
  }
}

resource "aws_instance" "server02" {
  ami                     = var.ubuntu_ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [aws_security_group.control_plane_sg.id, aws_security_group.ssh_sg.id]
  subnet_id               = aws_subnet.subnet_default.id

  tags = {
    Name = "server_02"
  }
}

resource "aws_instance" "server03" {
  ami                     = var.ubuntu_ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [aws_security_group.worker_sg.id, aws_security_group.ssh_sg.id]
  subnet_id               = aws_subnet.subnet_default.id

  tags = {
    Name = "server_03"
  }
}