provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "npm_web" {
   ami = var.ami_id
   instance_type = var.instance_type
   key_name               = var.key_name
   associate_public_ip_address = true

   vpc_security_group_ids = [aws_security_group.ssh_sg.id]

   tags = {
     Name = "var.instance_name"
     Environment = "Dev"
   }
}
