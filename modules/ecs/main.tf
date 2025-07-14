# module "vpc" {
#   source   = "../vpc"
#   env      = var.env
#   project  = var.project
#   vpc_cidr_block = aws_vpc.vpc.cidr_block
# }


# data "aws_subnet" "private_a" {
#   filter {
#     name   = "tag:Name"
#     values = ["private-a"]
#   }
# }

# data "aws_subnet" "private_c" {
#   filter {
#     name   = "tag:Name"
#     values = ["private-c"]
#   }
# }

# resource "aws_lb_target_group" "ecs" {
#   name     = "ecs-target-group"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc.id
#   target_type = "ip"
# }
