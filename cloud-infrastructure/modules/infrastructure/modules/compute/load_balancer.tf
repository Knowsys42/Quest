
resource "aws_alb" "web" {
  name            = "web-${var.environment}"
  internal        = false
  security_groups = ["${aws_security_group.web-alb.id}"]
  subnets         = local.subnets_ids
 
  tags = {
    environment = "${var.environment}"
    Name        = "${var.environment}-web-alb"
  }
}

resource "aws_alb_target_group" "quest_app" {
  name                 = "${var.environment}-app-target-group"
  port                 = 3000
  protocol             = "HTTP"
  vpc_id               = var.vpc-id
  target_type          = "ip"
  deregistration_delay = "30"
  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"

  }
}


resource "aws_alb_listener" "api" {
  load_balancer_arn = aws_alb.web.arn
  port              = "3000"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-2019-08"
  certificate_arn   = "arn:aws:acm:us-east-1:215412995827:certificate/36877581-5185-48d6-828b-81c7ac9520ff"

  default_action {
    target_group_arn = aws_alb_target_group.quest_app.id
    type             = "forward"
  }
}


