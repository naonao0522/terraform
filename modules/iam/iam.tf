# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "${var.project}-${var.env}-task-execution-role"
  
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action    = "sts:AssumeRole"
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         }
#         Effect    = "Allow"
#         Sid       = ""
#       },
#     ]
#   })
# }

# resource "aws_iam_role" "ecs_task_role" {
#   name = "${var.project}-${var.env}-task-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action    = "sts:AssumeRole"
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         }
#         Effect    = "Allow"
#         Sid       = ""
#       },
#     ]
#   })
# }
