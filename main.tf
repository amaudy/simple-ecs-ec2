provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecs_cluster" {
  source      = "./modules/ecscluster"
  commom_tags = var.common_tags
}

module "service" {
  source           = "./modules/service"
  cluster_id       = module.ecs_cluster.cluster_id
  vpc_id           = module.vpc.vpc_id
  subnets          = module.vpc.subnets
  target_group_arn = module.load_balancer.target_group_arn
  listener_arn     = module.load_balancer.nginx_listener_arn
  commom_tags      = var.common_tags
}

module "load_balancer" {
  source      = "./modules/load-balancer"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.subnets
  commom_tags = var.common_tags
}
