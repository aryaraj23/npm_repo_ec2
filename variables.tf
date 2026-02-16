variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "ami_id" {
  type = string
  description = "EC2 AMI ID"
}

variable "instance_type" {
  type = string
  description = "EEC2 instance type"
} 

variable "instance_name" {
  type = string
  description = "Name of the EC2 Instance"
}

variable "key_name" {
  description = "AWS Key pair"
  type = string
}
