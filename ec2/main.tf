resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = var.key_name       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
  

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > $HOME/myKey.pem"
  }
}

resource "aws_eip" "myeip" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ansible.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_instance" "ansible" {
  ami = (var.redhat == true ? data.aws_ami.centos.id : data.aws_ami.ubuntu.id)
  instance_type = var.instance_type 
  key_name = var.key_name
  iam_instance_profile = var.iam_instance_profile
  user_data = file("${path.module}/bootstrap.sh")
  tags = {
    Name = var.instance_name
    Terraform   = "true"
    Environment = var.environment
  }
}
