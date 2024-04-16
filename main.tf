terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecs_cluster" {
  source       = "./modules/ecscluster"
  commom_tags  = var.common_tags
  project_name = var.project_name
  environment  = var.environment
  region       = var.aws_region
  subnets = module.vpc.subnets
}

# module "service" {
#   source           = "./modules/service"
#   project_name     = var.project_name
#   environment      = var.environment
#   region           = var.aws_region
#   service_name     = var.service_name
#   cluster_id       = module.ecs_cluster.cluster_id
#   vpc_id           = module.vpc.vpc_id
#   subnets          = module.vpc.subnets
#   target_group_arn = module.load_balancer.target_group_arn
#   listener_arn     = module.load_balancer.nginx_listener_arn
#   commom_tags      = var.common_tags
# }

# module "load_balancer" {
#   source       = "./modules/load-balancer"
#   project_name = var.project_name
#   environment  = var.environment
#   region       = var.aws_region
#   vpc_id       = module.vpc.vpc_id
#   subnets      = module.vpc.subnets
#   commom_tags  = var.common_tags
# }
