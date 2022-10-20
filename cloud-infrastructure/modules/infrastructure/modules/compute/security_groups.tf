
resource "aws_security_group" "web-alb" {
  name        = "web-alb"
  description = "Web ALB"
  vpc_id      = var.vpc-id


  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
