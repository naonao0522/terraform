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

variable "name" {
  description = "The IAM role name"
  type        = string
}

variable "identifier" {
  description = "The identifier for the IAM role"
  type        = string
}

