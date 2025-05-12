resource "aws_instance" "example-ec2" {
  ami                         = var.ami_id[terraform.workspace]
  //availability_zone           = "us-east-1a"
  instance_type               = var.instance_type[terraform.workspace]
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnet1-terraform.id
  vpc_security_group_ids      = [aws_security_group.sg-terraform.id]
  associate_public_ip_address = true

  tags = {
  Name  = "ec2-server-${terraform.workspace}"
  Env   = terraform.workspace
  Owner = "Shruti"
 }


  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
    echo "<h1>${terraform.workspace}-Server-1</h1>" > /var/www/html/index.html
    systemctl start nginx
    systemctl enable nginx
  EOF
}
