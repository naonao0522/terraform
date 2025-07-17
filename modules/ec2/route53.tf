resource "aws_route53_zone" "hostzone" {
  name = "naonao0522.click"
}

resource "aws_route53_record" "alb_alias" {
  zone_id = aws_route53_zone.hostzone.zone_id
  name    = "naonao0522.click"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
#  depends_on = [aws_lb.alb] 
}