# ECR Dockerリポジトリ用VPCエンドポイント
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"  # Dockerリポジトリ用
  vpc_endpoint_type = "Interface"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  private_dns_enabled = true  # プライベートDNSを有効にして内部通信を可能にする

  tags = {
    Name = "${var.project}-${var.env}-vpce-ecr-dkr"
  }
}

# ECR API用VPCエンドポイント
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"  # API用
  vpc_endpoint_type = "Interface"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
  private_dns_enabled = true  # プライベートDNSを有効にして内部通信を可能にする

  tags = {
    Name = "${var.project}-${var.env}-vpce-ecr-api"
  }
}

# ECR ログ用VPCエンドポイント
resource "aws_vpc_endpoint" "ecr_logs" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]  # プライベートサブネットのIDを指定
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]  # ECSタスク用のセキュリティグループ

  private_dns_enabled = true  # プライベートDNSを有効にして、ECR Logsへの内部アクセスを可能にする

  tags = {
    Name = "${var.project}-${var.env}-vpce-ecr-logs"
  }
}

# ECR S3用VPCエンドポイント
resource "aws_vpc_endpoint" "s3" {
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.s3"
  route_table_ids = [
    aws_route_table.private_rt_ecs.id
  ]

  tags = {
    Name = "${var.project}-${var.env}-vpce-s3"
  }
}

# ECR SSM用VPCエンドポイント
resource "aws_vpc_endpoint" "ssm" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ssm"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]
  private_dns_enabled = true
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]

  tags = {
    Name = "${var.project}-${var.env}-vpce-ssm"
  }
}

# ECR ECSEXE用VPCエンドポイント
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ssmmessages"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]
  private_dns_enabled = true
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]

  tags = {
    Name = "${var.project}-${var.env}-vpce-ssmmessages"
  }
}

# ECR シークレットマネージャーE用VPCエンドポイント
resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.secretsmanager"
  subnet_ids        = [
    aws_subnet.private_a_ecs.id, 
    aws_subnet.private_c_ecs.id
  ]
  private_dns_enabled = true
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]

  tags = {
    Name = "${var.project}-${var.env}-vpce-secretsmanager"
  }
}

