variable "vpc_id" {
  type = string
}

variable "commom_tags" {
  type = map(string)
}

variable "cluster_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "listener_arn" {
  type = string
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

variable "service_name" {
  type = string
}