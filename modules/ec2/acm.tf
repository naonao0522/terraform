# 証明書発行リクエスト
resource "aws_acm_certificate" "tokyo_cert" {
  domain_name               = "naonao0522.click"     # メインドメイン
  subject_alternative_names = ["*.naonao0522.click"] # サブドメイン
  validation_method         = "DNS"


  tags = {
    Name    = "${var.project}-${var.env}-tokyo-acm"
  }

  lifecycle {
    # lifecycleにこれを入れておくのが推奨されている
    create_before_destroy = true
  }

  depends_on = [
    aws_route53_zone.hostzone
  ]
}

# DNSによる検証用レコードの登録
resource "aws_route53_record" "route53_acm_dns_resolve" {
  for_each = {
    for dvo in aws_acm_certificate.tokyo_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  allow_overwrite = true
  zone_id         = aws_route53_zone.hostzone.id
  name            = each.value.name
  type            = each.value.type
  ttl             = 600
  records         = [each.value.record]
}

# 検証
resource "aws_acm_certificate_validation" "cert_valid" {
  certificate_arn         = aws_acm_certificate.tokyo_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_acm_dns_resolve : record.fqdn]
}