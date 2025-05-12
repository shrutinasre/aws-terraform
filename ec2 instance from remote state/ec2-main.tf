#creating instance from Base-Infra.tfstate stored in s3 bucket which is created using remote state terraform

provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "example-ec2" {
ami = "ami-084568db4383264d4"
availability_zone = "us-east-1c"
instance_type = "t2.micro"
key_name = "demokey"
subnet_id = data.aws_subnet.public-subnet-remote-terraform.id
vpc_security_group_ids = ["${data.aws_security_group.sg-remote-terraform.id}"]
associate_public_ip_address = true

tags = {
Name = "ExampleInstance"
Env = "Prod"
Owner = "Shruti"
}

#Using create_before_destroy to prevent downtime
//lifecycle {
//  create_before_destroy = true
//  prevent_destroy = false
//}

}

terraform {
  backend "s3" {
    bucket = "remotestatebucket123"
    key    = "Current-state.tfstate"
    region = "ap-south-1"
  }
}

