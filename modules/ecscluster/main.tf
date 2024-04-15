resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-cluster-${var.region}-${var.environment}"
  tags = var.commom_tags
}
