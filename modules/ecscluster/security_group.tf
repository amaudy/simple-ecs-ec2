resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-cluster-${var.region}-${var.environment}-sg"
  description = "Security group for ECS EC2 instances ${var.project_name} ${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
