output "public_ip" {
  value = module.ec2.public_ip
}

output "jenkins_url" {
  value = "http://${module.ec2.public_ip}:8080"
}

