output "target_group_arn" {
  value = aws_lb_target_group.my_tg.arn
}

output "nginx_listener_arn" {
  value = aws_lb_listener.nginx_listener.arn
}

output "lb_dns" {
  value = aws_lb.nginx_alb.dns_name
}