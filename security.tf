# Security-related settings for aws_security_group

resource "aws_security_group" "allow-ssh-rdp-icmp-and-egress" {
  name = "allow-ssh-rdp-icmp-and-egress"
  description = "Allows SSH, RDP and ICMP traffic into instances as well as all eggress."
  vpc_id      = aws_vpc.tf.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mike_home_IP]
  }
  
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.mike_home_IP]
}

  ingress {
    from_port   = 0
	to_port     = 0
	protocol    = "icmp"
	cidr_blocks = [var.mike_home_IP]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_rdp_icmp-all"
	env = var.env_name
  }
}