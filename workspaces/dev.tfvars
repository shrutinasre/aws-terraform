region = "us-east-1" //can give any variable name

#VPC
vpc-cidr_block           = "10.1.0.0/16"
vpc-enable_dns_hostnames = true
vpc-tag_name             = "vpc-terraform-dev"

#Internet Gateway
ig-tag_name = "ig-terraform"

#Private Subnet
# privateSub-cidr_block = "10.0.1.0/24"
# privateSub-tag_name = "private-subnet-terraform"

#Public Subnet
publicSub-cidr_block1 = "10.1.0.0/16"
publicSub-tag_name1   = "public-subnet1-terraform-dev"

publicSub-cidr_block2 = "10.2.0.0/16"
publicSub-tag_name2   = "public-subnet2-terraform-dev"

publicSub-cidr_block3 = "10.3.0.0/16"
publicSub-tag_name3   = "public-subnet3-terraform-dev"

#Routing table
rt-cidr_block = "0.0.0.0/0"
rt-tag_name   = "rt-terraform-dev"

#Security Group
in-from_port   = 80
in-to_port     = 80
in-protocol    = "tcp"
in-cidr_blocks = ["0.0.0.0/0"]

eg-from_port   = 0
eg-to_port     = 0
eg-protocol    = "-1"
eg-cidr_blocks = ["0.0.0.0/0"]

sg-tag_name = "sg-terraform"

ec2-Env = "dev"