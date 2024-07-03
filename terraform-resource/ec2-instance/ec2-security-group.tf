resource "aws_security_group" "ec2-test-sg" { # creating security group
  name        = "test-instance-sg"
  description = "Allow inbound traffic and all outbound traffic"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Allow SSH inbound traffic"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Allow outbound traffic"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}