variable "region" {
    default = "us-east-1"
} //can give any variable name

variable "key_name" {
  default = "demokey"
}

#VPC
variable "vpc-cidr_block" {}

variable "vpc-enable_dns_hostnames" {}

variable "vpc-tag_name" {}

#Internet Gateway
variable "ig-tag_name" {}

# #Private Subnet
# variable "privateSub-cidr_block" {}
# variable "privateSub-tag_name" {}

#Public Subnet
variable "publicSub-cidr_block1" {}
variable "publicSub-tag_name1" {}

variable "publicSub-cidr_block2" {}
variable "publicSub-tag_name2" {}

variable "publicSub-cidr_block3" {}
variable "publicSub-tag_name3" {}

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
variable "ami_id" {
  type = map(string)
  default = {
    dev  = "ami-084568db4383264d4"
    uat  = "ami-084568db4383264d4"
    prod = "ami-084568db4383264d4"
  }
}

variable "availability_zone" {
  description = "Run the EC2 instances in these AZ"
  type        = map(string)
  default = {
    dev  = "us-east-1b"
    uat  = "us-east-1c"
    prod = "us-east-1d"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    uat  = "t2.micro"
    prod = "t2.micro"
  }
}

#variable "key_name" {}

# variable "associate_public_ip_address" {
    
# }

# variable "ec2-tag_name" {}

variable "ec2-Env" {}

# variable "ec2-Owner" {}