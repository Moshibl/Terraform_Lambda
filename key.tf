resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "PubKey" {
  key_name   = "iti"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "PrivKey" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/iti"
  file_permission = "0400"
}