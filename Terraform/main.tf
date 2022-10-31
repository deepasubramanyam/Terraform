resource "aws_instance" "deepa_ec2_instance" {
  ami           = "ami-076e3a557efe1aa9c"
  instance_type = var.instancetype
  key_name      = "deepa-key-pair"
  user_data     = "${file("install.sh")}"
}

resource "aws_security_group" "new_sg" {
  description = "Default security group to allow inbound/outbound"
  #   egress {
  #     from_port = "0"
  #     to_port   = "0"
  #     protocol  = "-1"
  #     self      = "true"
  #   }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
