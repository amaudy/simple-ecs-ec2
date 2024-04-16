resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-cluster-${var.region}-${var.environment}"
  tags = var.commom_tags
}

resource "aws_launch_configuration" "ecs_instances" {
  name          = "ecs-instances-${var.project_name}-cluster-${var.region}-${var.environment}"
  image_id      = data.aws_ami.latest_ami.id # Use the appropriate AMI for your region
  instance_type = "t3a.medium"
  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name
  security_groups = [aws_security_group.ecs_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=${aws_ecs_cluster.ecs_cluster.name} >> /etc/ecs/ecs.config
              EOF

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "ecs_asg" {
  name                 = "${var.project_name}-cluster-${var.region}-${var.environment}"
  launch_configuration = aws_launch_configuration.ecs_instances.id
  min_size             = 3
  max_size             = 5
  desired_capacity     = 3

  vpc_zone_identifier = var.subnets # error so many times

  tag {
    key                 = "Name"
    value               = "ecs-instances-${var.project_name}-${var.environment}"
    propagate_at_launch = true
  }
}
