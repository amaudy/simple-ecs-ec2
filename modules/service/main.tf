resource "aws_ecs_task_definition" "my_task" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256" # Adjust based on your needs
  memory                   = "512" # Adjust based on your needs
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  tags                     = var.commom_tags

  container_definitions = jsonencode([
    {
      name      = "my-app"
      image     = "nginx" # Example image
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}


resource "aws_ecs_service" "nginx_service" {
  name            = "nginx-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.my_task.arn
  launch_type     = "FARGATE"
  desired_count   = 3
  tags            = var.commom_tags

  network_configuration {
    subnets          = var.subnets
    assign_public_ip = true
    security_groups  = [aws_security_group.web_service.id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "my-app"
    container_port   = 80
  }

  depends_on = [
    # aws_lb_listener.nginx_listener,
    var.listener_arn,
    aws_iam_role_policy_attachment.ecs_task_execution_role_policy
  ]
}