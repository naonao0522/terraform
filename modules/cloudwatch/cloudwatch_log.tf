# ECS on Fargateのログ出力
resource "aws_cloudwatch_log_group" "for_ecs" {
  name              = "/aws/ecs/logs"
  retention_in_days = 30
}

# # WAF のログを出力
# resource "aws_cloudwatch_log_group" "waflogs" {
#   name              = "/aws-waf-logs-${var.project}-${var.env}"
#   retention_in_days = 30
# }