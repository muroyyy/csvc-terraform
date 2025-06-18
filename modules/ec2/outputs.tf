output "instance_public_ip" {
  value = aws_autoscaling_group.php_asg.id
}
