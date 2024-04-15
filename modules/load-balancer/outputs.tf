output "target_group_arn" {
  value = aws_lb_target_group.my_tg.arn
}

output "nginx_listener_arn" {
  value = aws_lb_listener.nginx_listener.arn
}