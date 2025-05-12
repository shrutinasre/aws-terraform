data "aws_vpc" "vpc-remote-terraform" {
  id = "vpc-0df129479a63272d5"
}

data "aws_subnet" "public-subnet-remote-terraform" {
  id = "subnet-09b4a51f756093754"
}

data "aws_security_group" "sg-remote-terraform" {
  id = "sg-0232fa03dd2db3e8c"
}
