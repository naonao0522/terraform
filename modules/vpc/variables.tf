variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-northeast-1"  # デフォルトリージョンを指定
}

variable "project" {
  description = "システム識別子"
  type        = string
  default     = "cheerpay"
}

variable "env" {
  description = "各環境"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for ECS tasks"
  type        = list(string)
  default     = []
}

# variable "private_subnets_id" {
#   description = "List of private subnet IDs"
#   type        = list(string)
# }

# variable "private_a_ecs" {
#   description = "ID of the private subnet for ECS"
#   type        = object({
#     id = string
#   })
# }



