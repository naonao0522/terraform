variable "vpc_id" {
  description = "The VPC ID"
  type        = string
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

variable "alb_subnet_ids" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

