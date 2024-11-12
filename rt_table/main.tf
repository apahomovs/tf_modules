resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.gateway_id != "" || var.nat_gateway_id != "" ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = var.gateway_id != "" ? var.gateway_id : null
      nat_gateway_id = var.nat_gateway_id != "" ? var.nat_gateway_id : null
    }
  }

  tags = {
    Name = "${var.gateway_id != "" ? "public" : "private"}_rtb"
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