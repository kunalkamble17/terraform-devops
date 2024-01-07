
provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_security_group" "sg-1" {
  name        = "sg-1"
  description = "Allow 22, 443, 8080, 80,"
  vpc_id      = vpc-0c0ea921f2aac0d2b

 ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = 0.0.0.0/0
  }

 ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = 0.0.0.0/0
  }

 ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = 0.0.0.0/0
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = 0.0.0.0/0
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "instance-1" {
  ami                     = "ami-0e347cff037f057c4"
  instance_type           = "t2.micro"
  key_name = "tokyo-yagi"
  vpc_security_group_ids = ["sg-0a83386f148e63533", aws_security_group.sg-1.id ] #refferSG
  name = "instance-1"
}