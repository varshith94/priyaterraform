resource "aws_vpc" "test" {
  cidr_block           = "10.45.0.0/16"
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_internet_gateway" "testigw" {
    vpc_id = aws_vpc.test.id
    tags = {
        "Name" = "${var.vpc_name}-igw"
    }
  
}