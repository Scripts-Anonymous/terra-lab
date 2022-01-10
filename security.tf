# Security-related settings for aws_security_group

resource "aws_security_group" "allow-ssh-in" {
  name = "allow-ssh-in"
  description = "Allows SSH in."
  vpc_id      = aws_vpc.tf.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mike_home_IP]
	description = "Mike-SSH"
  }
  tags = {
	env = var.env_name
  }
}

resource "aws_security_group" "allow-rdp-in" {
  name = "allow-rdp-in"
  description = "Allows RDP in."
  vpc_id      = aws_vpc.tf.id
  
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.mike_home_IP]
	description = "Mike-RDP"
  }
  tags = {
	env = var.env_name
  }
}

resource "aws_security_group" "allow-icmp-in" {
  name = "allow-icmp-in"
  description = "Allows ICMP in."
  vpc_id      = aws_vpc.tf.id
  
  ingress {
    from_port   = 0
	to_port     = 0
	protocol    = "icmp"
	cidr_blocks = [var.mike_home_IP]
	description = "Mike-Ping"
  }
  tags = {
	env = var.env_name
  }
}

resource "aws_security_group" "allow-all-egress" {
  name = "allow-egress"
  description = "Allows all eggress."
  vpc_id      = aws_vpc.tf.id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
	env = var.env_name
  }
}
