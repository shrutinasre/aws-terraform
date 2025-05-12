variable "region" {} //can give any variable name

#VPC
variable "vpc-cidr_block" {}

variable "vpc-enable_dns_hostnames" {}

variable "vpc-tag_name" {}

#Internet Gateway
variable "ig-tag_name" {}

#Private Subnet
variable "privateSub-cidr_block" {}

variable "privateSub-tag_name" {}

#Public Subnet
variable "publicSub-cidr_block" {}

variable "publicSub-tag_name" {}

#Routing table
variable "rt-cidr_block" {}

variable "rt-tag_name" {}

#Security Group
variable "in-from_port" {}

variable "in-to_port" {}

variable "in-protocol" {}

variable "in-cidr_blocks" {}

variable "eg-from_port" {}

variable "eg-to_port" {}

variable "eg-protocol" {}

variable "eg-cidr_blocks" {}

variable "sg-tag_name" {}

#Creating EC2 instance
variable "ami_id" {}

variable "availability_zone" {}

variable "instance_type" {}

variable "key_name" {}

variable "associate_public_ip_address" {}

variable "ec2-tag_name" {}

variable "ec2-Env" {}

variable "ec2-Owner" {}