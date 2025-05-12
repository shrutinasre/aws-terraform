terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "data-source-vpc" {
  id = "vpc-0e017eb882dd799b8"
//where vpc is already created manually so mention its name and id
}

#Joining internrt gateway using terraform
resource "aws_internet_gateway" "ig-datasource" {
  vpc_id = data.aws_vpc.data-source-vpc.id

  tags = {
    Name = "ig-datasource"
  }
}

#Private subnet
resource "aws_subnet" "subnet-data-source" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = data.aws_vpc.data-source-vpc.id
  tags = {
    Name = "subnet-data-source"
  }
}


