output "cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ami_id" {
  value = data.aws_ami.latest_ami.id
}