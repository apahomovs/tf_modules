resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id != "" ? var.gateway_id : null  # Only set if gateway_id is provided
    nat_gateway_id = var.nat_gateway_id != "" ? var.nat_gateway_id : null  # Only set if nat_gateway_id is provided
  }

  tags = {
    Name = "${var.gateway_id == "" ? "private" : "public"}_rtb"
  }
}


resource "aws_route_table_association" "assoc" {
  count = length(var.subnets)
  subnet_id = var.subnets[count.index]
  route_table_id = aws_route_table.rtb.id
}

# ? is a ternary operator (elvis operator)
# expression ? if_true : if_false
# 100 > 99 ? apple : banana
# variable Name == Steve
# name != David ? 100 : 200