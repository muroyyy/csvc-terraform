output "instance_public_ip" {
  value = aws_autoscaling_group.php_asg.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}
