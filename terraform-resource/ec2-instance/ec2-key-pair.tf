resource "aws_key_pair" "key-tf" { # creating ssh-key-pair
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}