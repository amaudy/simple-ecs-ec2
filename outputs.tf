output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cluster_id" {
  value = "Cluster ID: ${module.ecs_cluster.cluster_id}"
}

output "subnets" {
  value = module.vpc.subnets
}

output "target_group_arn" {
  value = module.load_balancer.target_group_arn
}

output "lb_dns" {
  value = module.load_balancer.lb_dns
}

output "ami_id" {
  value = "AMI ID for ECS instances: ${module.ecs_cluster.ami_id}"
}

output "aws_region" {
  value = var.aws_region
}