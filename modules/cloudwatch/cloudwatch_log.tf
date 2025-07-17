resource "aws_cloudwatch_log_group" "for_ecs" {
  name              = "/aws/ecs/logs"
  retention_in_days = 30
}