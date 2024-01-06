
provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "instance-1" {
  ami                     = "ami-0e347cff037f057c4"
  instance_type           = "t2.micro"
  key_name = "tokyo-yagi"
  vpc_security_group_ids = ["sg-0a83386f148e63533"]
  name = "instance-1"
}