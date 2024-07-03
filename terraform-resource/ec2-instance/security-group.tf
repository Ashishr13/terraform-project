# resource "aws_security_group" "allow_traffic" {
#   name        = "allow_tls"                         # Security group name
#   description = "Allow TLS inbound traffic and all outbound traffic"  # Description
#   vpc_id      = aws_vpc.main.id                     # VPC ID where the security group will be created

#   # Ingress rules (incoming traffic rules)
#   ingress {
#     description = "Allow SSH inbound traffic"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#   }

#   ingress {
#     description = "Allow HTTP inbound traffic"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#   }

#   ingress {
#     description = "Allow HTTPS inbound traffic"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#   }

#   # Egress rule (outgoing traffic rule)
#   egress {
#     description = "Allow all outbound traffic"
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }
# }
