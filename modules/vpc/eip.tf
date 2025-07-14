# resource "aws_eip" "nat_a" {
#   domain        = "vpc"
#   depends_on = [aws_internet_gateway.igw]
  
#   tags = {
#     Name = "${var.project}-${var.env}-eip"
#   }
# }