resource "aws_security_group" "alb_web_sg" {
  name        = "${var.project_name}-${var.region}-${var.environment}"
  description = "Allow all inbound traffic to the ALB ${var.project_name} ${var.environment}"
  vpc_id      = var.vpc_id
  tags        = var.commom_tags

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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