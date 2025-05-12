# Configure the AWS Provider
provider "aws" {
  region = var.region
}

#VPC
resource "aws_vpc" "vpc-terraform" {
  cidr_block           = var.vpc-cidr_block
  enable_dns_hostnames = var.vpc-enable_dns_hostnames

  tags = {
    Name = var.vpc-tag_name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "ig-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  tags = {
    Name = var.ig-tag_name
  }
}

#Private subnet
resource "aws_subnet" "private-subnet-terraform" {
  cidr_block = var.privateSub-cidr_block
  vpc_id     = aws_vpc.vpc-terraform.id
  tags = {
    Name = var.privateSub-tag_name
  }
}

#Public subnet
resource "aws_subnet" "public-subnet-terraform" {
  cidr_block = var.publicSub-cidr_block
  vpc_id     = aws_vpc.vpc-terraform.id
  //map_public_ip_on_launch = true
  tags = {
    Name = var.publicSub-tag_name
  }
}

#Routing table
resource "aws_route_table" "rt-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  route {
    cidr_block = var.rt-cidr_block
    gateway_id = aws_internet_gateway.ig-terraform.id
  }

  tags = {
    Name = var.rt-tag_name
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
    from_port   = var.in-from_port
    to_port     = var.in-to_port
    protocol    = var.in-protocol
    cidr_blocks = var.in-cidr_blocks
  }

  #Outbound rule
  egress {
    from_port   = var.eg-from_port
    to_port     = var.eg-to_port
    protocol    = var.eg-protocol //"-1" - All protocols - instances can connect to any external services (e.g., downloading packages, updates).
    cidr_blocks = var.eg-cidr_blocks
  }

  tags = {
    Name = var.sg-tag_name
  }
}

#Creating EC2 instance
resource "aws_instance" "example-ec2" {
  ami                         = var.ami_id
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnet-terraform.id //not using data as it contains in same file
  vpc_security_group_ids      = ["${aws_security_group.sg-terraform.id}"]
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name  = var.ec2-tag_name
    Env   = var.ec2-Env
    Owner = var.ec2-Owner
  }
}