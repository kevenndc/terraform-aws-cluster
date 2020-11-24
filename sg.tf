resource "aws_security_group" "kubernetes_api_server_sg" {
  name        = "kubernetes-api-server-sg"
  description = "SG do Kubernetes API Server"
  vpc_id      = aws_vpc.vpc_default.id

  ingress {
    description = "Trafego dentro do proprio SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "Trafego dentro do proprio SG"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_default.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kubernetes-api-server-sg"
  }
}

resource "aws_security_group" "control_plane_sg" {
  name        = "control-plane-sg"
  description = "SG dos nodes Control Plane"
  vpc_id      = aws_vpc.vpc_default.id

  ingress {
    description = "Trafego dentro do proprio SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "control-plane-sg"
  }
}

resource "aws_security_group" "worker_sg" {
  name        = "worker-sg"
  description = "SG dos nodes Workers"
  vpc_id      = aws_vpc.vpc_default.id

  ingress {
    description = "Trafego dentro do proprio SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "worker-sg"
  }
}

resource "aws_security_group" "ssh_sg" {
  name        = "ssh-sg"
  description = "SG de SSH"
  vpc_id      = aws_vpc.vpc_default.id

  ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  

    tags = {
      Name = "ssh-sg"
    }
}