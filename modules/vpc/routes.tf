# パブリックルートテーブルの定義
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = "${var.project}-${var.env}-pub-alb-rt"
  }
}

resource "aws_route_table" "public_ng" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = "${var.project}-${var.env}-pub-ng-rt"
  }
}

# インターネットゲートウェイへのルート設定
resource "aws_route" "public_a" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# パブリックサブネットAをパブリックルートテーブルに関連付け
resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_a_alb.id
}

# パブリックサブネットCをパブリックルートテーブルに関連付け
resource "aws_route_table_association" "public_c" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_c_alb.id
}

# パブリックサブネットDをパブリックルートテーブルに関連付け
resource "aws_route_table_association" "public_d" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_d_alb.id
}

# NATゲートウェイをパブリックルートテーブルに関連付け
resource "aws_route_table_association" "public_a_ng" {
  route_table_id = aws_route_table.public_ng.id
  subnet_id      = aws_subnet.public_a_ng.id
}

# プライベートルートテーブルの定義 (ECS用)
resource "aws_route_table" "private_rt_ecs" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = "${var.project}-${var.env}-pri-ecs-rt"
  }
}

# プライベートサブネットAをプライベートルートテーブルに関連付け
resource "aws_route_table_association" "private_a" {
  route_table_id = aws_route_table.private_rt_ecs.id
  subnet_id      = aws_subnet.private_a_ecs.id
}
