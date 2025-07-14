variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-northeast-1"  # デフォルトリージョンを指定
}

variable "env" {
  description = "✅次から環境を選択してください（dev, staging, prod）"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "✅"
  type        = string
  default     = "cheerpay"
}