resource "aws_lb" "nginx_alb" {
  name               = "${var.project_name}-${var.region}-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_web_sg.id]
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = var.commom_tags
}

resource "aws_lb_target_group" "my_tg" {
  name     = "${var.project_name}-${var.region}-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance" #  "instance" if using EC2 launch type
  tags        = var.commom_tags

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}
