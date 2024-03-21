resource "aws_route_table" "testrt" {
    vpc_id = aws_vpc.test.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.testigw.id
    }
    tags = {
      "Name" = "${var.vpc_name}-rt"
    }
  
}

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.testpublic1.id
    route_table_id = aws_route_table.testrt.id
  
}
resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.testpublic2.id
    route_table_id = aws_route_table.testrt.id
  
}
resource "aws_route_table_association" "public3" {
    subnet_id = aws_subnet.testpublic3.id
    route_table_id = aws_route_table.testrt.id
  
}