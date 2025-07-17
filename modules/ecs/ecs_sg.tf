# セキュリティグループの作成
resource "aws_security_group" "ecs_sg" {
  name   = "${var.project}-${var.env}-ecs-sg"
  description = "Security group for ECS"
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
  Name = "${var.project}-${var.env}-ecs-sg"
  }
}

# セキュリティグループIDの出力
output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}