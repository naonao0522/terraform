# ECS Fargateはプライベートサブネットに配置し、VPCエンドポイントでECRなどに接続しているため、不要

# resource "aws_nat_gateway" "nat_a" {
#   allocation_id = aws_eip.nat_a.id
#   subnet_id     = aws_subnet.public_a_ng.id
#   depends_on    = [aws_internet_gateway.igw]
  
#   tags = {
#     Name = "${var.project}-${var.env}-ng"
#   }
# }

# # NATゲートウェイへのルート設定
# resource "aws_route" "public_ng" {
#   route_table_id         = aws_route_table.public_ng.id
#   nat_gateway_id         = aws_nat_gateway.nat_a.id
#   destination_cidr_block = "0.0.0.0/0"
# }
