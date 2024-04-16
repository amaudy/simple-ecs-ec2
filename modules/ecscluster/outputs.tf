output "cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ami_id" {
  value = data.aws_ami.latest_ami.id
}

output "cloudwathc_log_group_name" {
  value = aws_cloudwatch_log_group.ecs_log_group.name
}