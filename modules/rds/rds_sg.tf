# セキュリティグループの作成
resource "aws_security_group" "rds_sg" {
  name   = "${var.project}-${var.env}-rds-sg"
  description = "Security group for RDS"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
  Name = "${var.project}-${var.env}-rds-sg"
  }
}

# セキュリティグループIDの出力
output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}