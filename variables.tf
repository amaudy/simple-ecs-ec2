variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev",
    Project     = "my-project"
  }
}

# variable "vpc_id" {
#   type = string
# }

# variable "cluster_id" {
#   type = string
# }