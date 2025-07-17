resource "aws_security_group" "vpc_endpoint_sg" {
  name        = "${var.project}-${var.env}-vpce-sg"
  description = "Security group for VPC Endpoints"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # VPCのCIDR範囲
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # 必要なアウトバウンド通信を許可
  }

  tags = {
    Name = "${var.project}-${var.env}-vpce-sg"
  }
}