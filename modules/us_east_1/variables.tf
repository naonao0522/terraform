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

variable "load_balancer_arn" {
  type = string
}

# variable "cloudwatch_log_group_waflogs_arn" {
#   type        = string
# }