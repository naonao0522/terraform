# Aurora PostgreSQLクラスタの設定
resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier                  = "${var.project}-${var.env}-cluster"
  engine                              = "aurora-postgresql"
  engine_version                      = "16.1"
  master_username                     = "postgres"
  master_password                     = "Testpass1"
  port                                = 5432
  database_name                       = "test"
  vpc_security_group_ids              = [aws_security_group.rds_sg.id]
  db_subnet_group_name                = aws_db_subnet_group.aurora_subnet_group.name
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.aurora_pg16_cluster_pg.name
  storage_encrypted                   = true  # 暗号化を有効化
  kms_key_id                          = null  # デフォルト KMS キー使用
  iam_database_authentication_enabled = false
  skip_final_snapshot                 = true
  apply_immediately                   = true
  deletion_protection                 = false
}

# Aurora PostgreSQLインスタンスの設定
resource "aws_rds_cluster_instance" "aurora_instance" {
  identifier                            = "${var.project}-${var.env}-instance-1"
  cluster_identifier                    = aws_rds_cluster.aurora_cluster.id
  instance_class                        = "db.t4g.medium"  # 最小クラス
  engine                                = "aurora-postgresql"
  engine_version                        = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible                   = false       # パブリックアクセス無効
  performance_insights_enabled          = true # Performance Insights 有効化
  performance_insights_retention_period = 7    # 7日間保持（無料枠）
  db_subnet_group_name                  = aws_db_subnet_group.aurora_subnet_group.name
}

# Aurora PostgreSQLインスタンス（リ－ダー）の設定
# resource "aws_rds_cluster_instance" "aurora_reader" {
#   identifier              = "aurora-reader-1"
#   cluster_identifier      = aws_rds_cluster.aurora_cluster.id
#   instance_class          = "db.t4g.medium"
#   engine                  = "aurora-postgresql"
#   engine_version          = aws_rds_cluster.aurora_cluster.engine_version
#   publicly_accessible     = false
#   db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
#   performance_insights_enabled          = true
#   performance_insights_retention_period = 7
# }

# クラスタ用カスタムパラメータグループの設定
resource "aws_rds_cluster_parameter_group" "aurora_pg16_cluster_pg" {
  name        = "aurora-pg16-custom-cluster"
  family      = "aurora-postgresql16"
  description = "Custom Aurora PostgreSQL 16 Cluster Parameter Group"

  parameter {
    name         = "rds.logical_replication"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_min_duration_statement"
    value        = "1000"
    apply_method = "immediate"
  }

  parameter {
    name         = "idle_in_transaction_session_timeout"
    value        = "300000" # 5 minutes
    apply_method = "immediate"
  }
}

# インスタンス用カスタムパラメータグループの設定
resource "aws_db_parameter_group" "aurora_pg16_instance_pg" {
  name        = "aurora-pg16-custom-instance"
  family      = "aurora-postgresql16"
  description = "Custom Aurora PostgreSQL 16 Instance Parameter Group"

  parameter {
    name         = "work_mem"
    value        = "8192"
    apply_method = "immediate"
  }

  parameter {
    name         = "max_connections"
    value        = "300"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_statement"
    value        = "ddl"
    apply_method = "immediate"
  }
}

# カスタムオプショングループの設定
resource "aws_db_option_group" "aurora_pg_option" {
  name                     = "aurora-pg-custom-option-group"
  engine_name              = "aurora-postgresql"
  major_engine_version     = "16.1"
  option_group_description = "Custom option group for Aurora PostgreSQL 16"
}

# サブネットグループの設定
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${var.project}-${var.env}-sg"
  description = "Subnet group for Aurora cluster"
  subnet_ids = var.rds_subnet_ids

  tags = {
    Name = "${var.project}-${var.env}-sg"
  }
}
