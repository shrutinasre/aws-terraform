# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#So that state will be preserved in s3
terraform {
  backend "s3" {
    bucket = "remotestatebucket123"
    key    = "Base-Infra.tfstate"
    region = "ap-south-1"
  }
}


#VPC
resource "aws_vpc" "vpc-remote-terraform" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "vpc-remote-terraform"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "ig-remote-terraform" {
  vpc_id = aws_vpc.vpc-remote-terraform.id

  tags = {
    Name = "ig-remote-terraform"
  }
}

#Private subnet
resource "aws_subnet" "private-subnet-remote-terraform" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc-remote-terraform.id
  tags = {
    Name = "private-subnet-remote-terraform"
  }
}

#Public subnet
resource "aws_subnet" "public-subnet-remote-terraform" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.vpc-remote-terraform.id
  //map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-remote-terraform"
  }
}

#Routing table
resource "aws_route_table" "rt-remote-terraform" {
  vpc_id = aws_vpc.vpc-remote-terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-remote-terraform.id
  }

  tags = {
    Name = "rt-remote-terraform"
  }
}

#Subnet Association
resource "aws_route_table_association" "public-sub-association" {
  route_table_id = aws_route_table.rt-remote-terraform.id
  subnet_id      = aws_subnet.public-subnet-remote-terraform.id
}

#Security Group
resource "aws_security_group" "sg-remote-terraform" {
  vpc_id = aws_vpc.vpc-remote-terraform.id

  #Inbound rule for HTTP
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  //All protocols - instances can connect to any external services (e.g., downloading packages, updates).
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-remote-terraform"
  }
}