data "aws_ami" "amazon-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "dev_machine" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = "jenkins"
  vpc_security_group_ids = ["sg-0649ecfc12248c271"]
  subnet_id              = "subnet-0e6a5ed6484656643"

  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
