resource "aws_lb" "alb" {
  name               = "${var.project}-${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.alb_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.project}-${var.env}-alb"
  }
}

# ALBのACMのSSL証明書を紐づけてHTTPSに設定
# resource "aws_lb_listener" "aws_listener_https" {
#   depends_on = [aws_acm_certificate_validation.cert_valid]
  
#   load_balancer_arn = aws_lb.alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
#   certificate_arn   = aws_acm_certificate.tokyo_cert.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs.arn
#   }
# }

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs.arn
  }
}

resource "aws_lb_listener_rule" "ecs_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}






