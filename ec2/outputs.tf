output "instance_ip_addr" {
  value = aws_instance.ansible.public_ip
  description = "value of the public ip instance"
}
output "data_ami_ubuntu" {
  value = data.aws_ami.ubuntu
}
output "data_ami_centos" {
  value = data.aws_ami.centos
}

