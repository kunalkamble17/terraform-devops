
provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_security_group" "sg1" {
  name        = "my-sg-tokyo"
  description = "Allow 22, 443, 8080, 80,"
  vpc_id      = "vpc-0c0ea921f2aac0d2b"

 ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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

/*
#resource "aws_s3_bucket" "bucket_my" {
  #bucket = "terra1-bucket"

  #versioning {
    #enabled = true
  #}

  #tags = {
    #Name        = "bucket-terra1"
    #Environment = "Dev"
  #}
#}
*/

/*
terraform {
  backend "s3" {
    bucket         = "terra1-bucket"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    access_key = "AKIAS7C75IHQVMTUMGNE"
    secret_key = "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"
  }
}
*/

#resource "aws_instance" "instance-1" {
  #ami                     = "ami-0e347cff037f057c4"
  #instance_type           = "t2.micro"
  #key_name = "tokyo-yagi"
  #vpc_security_group_ids = ["sg-0a83386f148e63533", aws_security_group.sg1.id ] #refferS
  #tags = {
    #Name = "server"
 # }
#}


resource "aws_instance" "instance-1" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name = "tokyo-yagi"
  vpc_security_group_ids = ["sg-0a83386f148e63533", aws_security_group.sg1.id ] #refferS
  tags = {
    Name = "server"
  }
}

variable "instance_type" {
        type = string
        default = "t2.micro"
}

variable "ami" {
        type = string
        default = "ami-0e347cff037f057c4"
}

output "Terra" {
        value = "I Love Terraform"
        }

output "public_ip" {
        value = "aws_instance.instance-1.public_ip"
}

output "arn" {
        value =  "aws_instance.instance-1.arn"
}

output "volume_id" {
        value =  "aws_instance.instance-1.volume_id"
}

output "instance_state" {
        value =  "aws_instance.instance-1.instance_state"
}
