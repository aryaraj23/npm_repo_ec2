provider "aws" {
  region = var.aws_region
}


# Security Group
resource "aws_security_group" "ssh_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to your IP in production
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ssh-sg"
  }
}

resource "aws_instance" "npm_web" {
   ami = var.ami_id
   instance_type = var.instance_type
   key_name               = var.key_name
   associate_public_ip_address = true

   vpc_security_group_ids = [aws_security_group.ssh_sg.id]

   tags = {
     Name = var.instance_name
     Environment = "Dev"
   }
}
