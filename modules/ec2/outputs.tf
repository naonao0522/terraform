output "ecs_target_group_arn" {
  value = aws_lb_target_group.ecs.arn
}

output "load_balancer_arn" {
  value = aws_lb.alb.arn
}

