resource "aws_instance" "npm_web" {
   ami = var.ami_id
   instance_type = var.instance_type

   tags = {
     Name = "var.instance_name"
     Environment = "Dev"
   }
}
