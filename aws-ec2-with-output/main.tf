terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

locals {
  owner = "abc"
  name = "terraserver1"
}

resource "aws_instance" "terraServer1" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = var.instance_type
    root_block_device {
      delete_on_termination = true
      volume_size = var.ec2_config.v_size
      volume_type = var.ec2_config.v_type
    }
    tags = merge(var.additional_tags, {
      Name = local.name
    })
}