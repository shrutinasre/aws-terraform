# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#VPC
resource "aws_vpc" "vpc-terraform" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "vpc-terraform"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "ig-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  tags = {
    Name = "ig-terraform"
  }
}

#Private subnet
resource "aws_subnet" "private-subnet-terraform" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc-terraform.id
  tags = {
    Name = "private-subnet-terraform"
  }
}

#Public subnet
resource "aws_subnet" "public-subnet-terraform" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.vpc-terraform.id
  //map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-terraform"
  }
}

#Routing table
resource "aws_route_table" "rt-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-terraform.id
  }

  tags = {
    Name = "rt-terraform"
  }
}

#Subnet Association
resource "aws_route_table_association" "public-sub-association" {
  route_table_id = aws_route_table.rt-terraform.id
  subnet_id      = aws_subnet.public-subnet-terraform.id
}

#Security Group
resource "aws_security_group" "sg-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

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
    Name = "sg-terraform"
  }
}