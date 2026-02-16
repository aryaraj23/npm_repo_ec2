output "instance_id" {
  description = "EC2 Instance ID"
  value = aws_instance.web-npm.id
}
