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
resource "aws_internet_gateway" "tfgateway" {
  vpc_id = aws_vpc.tf.id
  tags = {
    name = "tf_gateway"
	env = var.env_name
  }
}

resource "aws_subnet" "tfpublic" {
  cidr_block = "10.0.0.0/24"
  vpc_id = "${aws_vpc.tf.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf_publicsubnet"
	env = var.env_name
  }
}

resource "aws_subnet" "tfprivate" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.tf.id}"
  map_public_ip_on_launch = false
  tags = {
    Name = "tf_privatesubnet"
	env = var.env_name
  }
}

resource "aws_route_table" "tftable" {
  vpc_id = aws_vpc.tf.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfgateway.id
  }
}

resource "aws_route_table_association" "rta_subnet_tfpublic" {
  subnet_id      = aws_subnet.tfpublic.id
  route_table_id = aws_route_table.tftable.id
}