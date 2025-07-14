# resource "aws_nat_gateway" "nat_a" {
#   allocation_id = aws_eip.nat_a.id
#   subnet_id     = aws_subnet.public_a_ng.id
#   depends_on    = [aws_internet_gateway.igw]
  
#   tags = {
#     Name = "${var.project}-${var.env}-ng"
#   }
# }