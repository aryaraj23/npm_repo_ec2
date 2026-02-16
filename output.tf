output "instance_id" {
  description = "EC2 Instance ID"
  value = aws_instance.npm_web.id
}

output "public_ip" {
  description = "EC2 instance public ID"
  value = aws_instance.npm_web.public_id
}
