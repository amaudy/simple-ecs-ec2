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
