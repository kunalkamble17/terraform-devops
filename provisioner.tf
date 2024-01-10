provider "aws" {
   region = "ap-northeast-1"
   access_key = "AKIAS7C75IHQVMTUMGNE"
   secret_key = "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"
}


resource "aws_instance" "instance1" {
   ami                     = "ami-0506f0f56e3a057a4"
   instance_type           = "t2.micro"
   key_name = "tokyo-yagi"
   vpc_security_group_ids = ["sg-0a83386f148e63533",] 
   
/*   ###FILE PROVISIONER###
    provisioner "file" {
    source      = "index.html"
    destination = "/var/www/index.html"

    connection {
      type        = "ssh"
      user        = "ec2-user"       # Replace with your EC2 instance's SSH username
      private_key = file("/mnt/c/Users/kunal/Downloads/aws-Izuku/tokyo-yagi.pem")  # Replace with the path to your private key
      host        = aws_instance.instance1.public_ip   # 'self' refers to the created EC2 instance
    }

	}

*/ 
     ###LOCAL PROVISIONER
    provisioner "local-exec" {
	command = "touch 123"
	}

  ###REMOTE PROVISIONER####
   
    connection {
	type = "ssh"
	user = "ec2-user"
	private_key = file("/mnt/c/Users/kunal/Downloads/aws-Izuku/tokyo-yagi.pem") 
	host = self.public_ip
   }

	provisioner "remote-exec" {
	   inline = [
	"yum install httpd -y",
	"systemctl start httpd",
	"systemctl enable httpd"
]
     }

}

