variable "commom_tags" {
  type = map(string)
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}