# Provisioning of EC2 instances

resource "aws_instance" "jatwin0"{
  ami           = "ami-0d80714a054d3360c"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf0.id}"
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh-rdp-icmp-and-egress.id}",
  ]
  tags = {
    Name = "JATwin0",
	OS = "Windows",
	env = var.env_name,
  }
}

/*
resource "aws_instance" "jatwin1" {
  ami           = "ami-0d80714a054d3360c"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf1.id}"
  tags = {
    Name = "JATwin1",
	OS = "Windows",
	env = var.env_name,
  }
}

resource "aws_instance" "jatwin2" {
  ami           = "ami-0d80714a054d3360c"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf2.id}"
  tags = {
    Name = "JATwin2"
	OS = "Windows"
	env = var.env_name
  }
}
*/

resource "aws_instance" "jatubnt0"{
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf0.id}"
    vpc_security_group_ids = [
    "${aws_security_group.allow-ssh-rdp-icmp-and-egress.id}",
  ]
  tags = {
    Name = "JATubnt0"
	OS = "Ubuntu"
	env = var.env_name
  }
}

/*
resource "aws_instance" "jatubnt1" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf1.id}"
  tags = {
    Name = "JATubnt1"
	OS = "Ubuntu"
	env = var.env_name
  }
}

resource "aws_instance" "jatubnt2" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "test-key"
  subnet_id = "${aws_subnet.tf2.id}"
  tags = {
    Name = "JATubnt2"
	OS = "Ubuntu"
	env = var.env_name
  }
}
*/