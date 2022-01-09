# Provisioning of aws networking

# The VPC
resource "aws_vpc" "tf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf-vpc"
	env = var.env_name
  }
}

# The Internet gateway associated with our VPC
resource "aws_internet_gateway" "tf_gateway" {
  vpc_id = aws_vpc.tf.id
  tags = {
    name = "tf_gateway"
	env = var.env_name
  }
}

resource "aws_subnet" "tf0" {
  cidr_block = "10.0.0.0/24"
  vpc_id = "${aws_vpc.tf.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-subnet0"
	env = var.env_name
  }
}
resource "aws_subnet" "tf1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.tf.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-subnet1"
	env = var.env_name
  }
}
resource "aws_subnet" "tf2" {
  cidr_block = "10.0.2.0/24"
  vpc_id = "${aws_vpc.tf.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-subnet2"
	env = var.env_name
  }
}