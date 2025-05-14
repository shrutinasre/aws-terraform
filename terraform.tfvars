region = "us-east-1" //can give any variable name

#VPC
vpc-cidr_block = "10.0.0.0/16"

vpc-enable_dns_hostnames = true

vpc-tag_name = "vpc-terraform"

#Internet Gateway
ig-tag_name = "ig-terraform"

#Private Subnet
privateSub-cidr_block = "10.0.1.0/24"

privateSub-tag_name = "private-subnet-terraform"

#Public Subnet
publicSub-cidr_block = "10.0.2.0/24"

publicSub-tag_name = "public-subnet-terraform"

#Routing table
rt-cidr_block = "0.0.0.0/0"

rt-tag_name = "rt-terraform"

#Security Group
in-from_port = 0

in-to_port = 0

in-protocol = "-1"

in-cidr_blocks = ["0.0.0.0/0"]

eg-from_port = 0

eg-to_port = 0

eg-protocol = "-1"

eg-cidr_blocks = ["0.0.0.0/0"]

sg-tag_name = "sg-terraform"

#Creating EC2 instance
ami_id = "ami-084568db4383264d4"

availability_zone = "us-east-1a"

instance_type = "t2.micro"

key_name = "demokey"

associate_public_ip_address = true

ec2-tag_name = "ExampleInstance"

ec2-Env = "Prod"

ec2-Owner = "Shruti"