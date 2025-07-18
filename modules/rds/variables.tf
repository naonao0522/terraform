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

variable "rds_subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}