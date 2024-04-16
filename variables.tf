variable "project_name" {
  type    = string
  default = "poc-ecs"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev",
    Project     = "my-project"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "service_name" {
  type    = string
  default = "webapp"
}
