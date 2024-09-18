resource "aws_instance" "instances" {


  ami                    = data.aws_ami.ami_info.id
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.sg_group.id]
  tags = {
    Name = "instance_${terraform.workspace}"
  }
}


resource "aws_security_group" "sg_group" {

  name        = "sg_group_${terraform.workspace}"
  description = "allow port no 22"

  ingress {

    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]


  }


  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_group_${terraform.workspace}"
  }

}