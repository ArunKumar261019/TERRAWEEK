output "instance_ids" {
  value = aws_instance.web[*].id
}

output "public_ips" {
  value = aws_instance.web[*].public_ip
}

output "web_urls" {
  value = [
    for ip in aws_instance.web[*].public_ip :
    "http://${ip}"
  ]
}

output "ami_id" {
  value = data.aws_ami.al2023.id
}