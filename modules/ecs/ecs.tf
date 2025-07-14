# 1. ECS クラスターの作成 (最初に作成)
resource "aws_ecs_cluster" "fargate_cluster" {
  name = "${var.project}-${var.env}-cluster"
}

# 2. ECS タスク定義の作成 (タスク定義はクラスターが作成された後に作成する必要がある)
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "fargate-task"
  execution_role_arn       = var.ecs_task_execution_role_arn  # 修正
  task_role_arn            = var.ecs_task_role_arn  # 修正
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions    = jsonencode([{
    name      = "app-container"
    image     = "nginx:latest"
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
  }])

  tags = {
    Name = "${var.project}-${var.env}-task"
  }
}

# 3. ECS サービスの作成 (最も後に作成)
resource "aws_ecs_service" "fargate_service" {
  name            = "fargate-service"
  cluster         = aws_ecs_cluster.fargate_cluster.id   # クラスター ID を直接参照
  task_definition = aws_ecs_task_definition.fargate_task.arn  # タスク定義の ARN を参照
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets          = var.subnet_id  # 変数を使用
    security_groups  = [aws_security_group.nginx_sg.id]  # nginx_sg.tf から直接参照
    assign_public_ip = false
  }
  
  load_balancer {
    container_name   = "app-container" 
    container_port   = 80
    target_group_arn = var.ecs_target_group_arn
  }
}
