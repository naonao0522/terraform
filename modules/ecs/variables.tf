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

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnets_id" {
  description = "List of private subnets for the ECS service"
  type        = list(string)
}

variable "ecs_task_execution_role_arn" {
   type        = string
}

variable "ecs_task_role_arn" {
   type        = string
}

variable "ecs_target_group_arn" {
  type = string
}

variable "desired_count" {
  description = "The ECS cluster ID"
  type        = string
}

# variable "security_group_ids" {
#   description = "List of security group IDs for ECS tasks"
#   type        = list(string)
# }

