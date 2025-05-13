variable "aws_region" {
  description = "value of region"
  type = string
  default = "us-east-1"
}

variable "profile" {
  default = "MyAWS"
}

variable "ec2_ami" {
  default = "ami-0cf10cdf9fcd62d37"
}

variable "instance_type" {
  description = "What instance type you want to create?"
  #default = "t2.micro" - it will ask on terminal if default is not mentioned
  type = string
  validation {
    condition = var.instance_type=="t2.micro" || var.instance_type=="t3.micro"
    error_message = "The instance type must be either 't2.micro' or 't3.micro'."
  }
}

#variable "root_volume_size" {
  #type = number
#}

#variable "root_volume_type" {
  #type = string
  #default = "gp2"
#} 
#Instaed of writing above two variables separeate we can combine 
#if we want to use it in same block

variable "ec2_config"{
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}

variable "ec2_keypair" {
  default = "aws-classroomkp"
}

variable "ec2_count" {
  type = number
  default = "5"
}

variable "environment" {
  default = "dev"
}

variable "product" {
  default = "sales"
}
variable "vpc_id" {
  default = "vpc-0156a750068fffd6b"
}
variable "subnets" {
   default = ["subnet-0e69b0bb37a414200","subnet-003f75b4d71f55c7d","subnet-0dd81f06ce1c4dbac"]
}

variable "additional_tags" {
  type = map(string) #expecting key=value format
  default = {}
  
}