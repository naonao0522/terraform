# 1. ECS クラスターの作成 (最初に作成)
resource "aws_ecs_cluster" "fargate_cluster" {
  name = "${var.project}-${var.env}-cluster"
}

# 2. ECS タスク定義の作成 (タスク定義はクラスターが作成された後に作成する必要がある)
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "${var.project}-${var.env}-ecs-task-definition" # タスク定義のファミリー名。バージョン管理に使用される
  requires_compatibilities = ["FARGATE"] # このタスク定義の起動タイプ
  network_mode             = "awsvpc" # タスクのネットワークモード。awsvpcはFargateで必須
  cpu                      = "256" # コンテナに割り当てるCPUユニット
  memory                   = "512" # コンテナに割り当てるメモリ（MiB）
  task_role_arn            = var.ecs_task_role_arn 
  execution_role_arn       = var.ecs_task_execution_role_arn # タスク実行時に使用するIAMロールのARN
  container_definitions    = jsonencode([{ # コンテナ定義
    name      = "app-container"
    image     = "442376921734.dkr.ecr.ap-northeast-1.amazonaws.com/cheerpay-repo:latest"  
    essential = true # このコンテナが必須かどうか。trueの場合、このコンテナが停止するとタスクも停止する
    portMappings = [
      {
        containerPort = 80 # コンテナ内のポート番号
        hostPort      = 80 # ホスト内のポート番号
        protocol      = "tcp" # 使用するプロトコル
      }
    ]
      logConfiguration = { # ログ設定
        logDriver = "awslogs" # 使用するログドライバー
        options = {
          "awslogs-group"         = "/aws/ecs/app-container" # CloudWatchロググループ名
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  runtime_platform {
    cpu_architecture        = "X86_64" # 使用するCPUアーキテクチャ
    operating_system_family = "LINUX" # 使用するOS
  }

  tags = {
    Name = "${var.project}-${var.env}-task"
  }
}

# 3. ECS サービスの作成 (最も後に作成)
resource "aws_ecs_service" "fargate_service" {
  name                   = "${var.project}-${var.env}-fargate-service"
  cluster                = aws_ecs_cluster.fargate_cluster.id  # このサービスが属するECSクラスターのID
  task_definition        = aws_ecs_task_definition.fargate_task.arn # 実行するタスク定義のARN
  desired_count          = var.desired_count # 常に実行しておきたいタスクの数
  launch_type            = "FARGATE" # 起動タイプ
  enable_execute_command = true # ECS Execを有効
  network_configuration {
    subnets          = var.private_subnets_id
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false # パブリックIPアドレスを割り当てるかどうか
  }
  
  load_balancer {
    container_name   = "app-container" 
    container_port   = 80
    target_group_arn = var.ecs_target_group_arn
  }
}
