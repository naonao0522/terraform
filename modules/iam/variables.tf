# modules/iam/variables.tf

# variable "vpc_cidr_block" {
#   description = "The VPC CIDR block"
#   type        = string
#   default     = ""
# }

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

# variable "vpc_cidr" {
#   description = "The CIDR block for the VPC"
#   type        = string
# }
# variable "policy" {
#   description = "The IAM policy ARN"
#   type        = string
#   default     = ""
# }

variable "name" {
  description = "The IAM role name"
  type        = string
}

variable "identifier" {
  description = "The identifier for the IAM role"
  type        = string
}

