#key-value
resource "aws_key_pair" "key-tf" {
  key_name = var.key_name
  public_key = var.key
}

resource "aws_instance" "webserver" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key-tf.key_name
  tags = {
    Name = "webserver-instance"
  }
}