/*
#------------------------------------------------------------------------------
# ECS CLUSTER
#------------------------------------------------------------------------------
locals {
  subnets_ids = [
    "${var.public-subnet-id}",
    "${var.public2-subnet-id}",
  ]
}

locals {
  secret_word = jsondecode(
    data.aws_secretsmanager_secret_version.secret_word.secret_string
  )
}



data "aws_secretsmanager_secret_version" "secret_word" {
  # Fill in the name you gave to your secret
  secret_id = "secret_word"
}


resource "aws_ecs_cluster" "cluster" {

  name = "${var.environment}-cluster"

}
module "quest_app" {
  source = "github.com/mongodb/terraform-aws-ecs-task-definition"

  environment = [
    {
      name  = "SECRET_WORD"
      value = local.secret_word.secret_word
    },
    
  ]


  family = "quest"

  image             = "215412995827.dkr.ecr.us-east-1.amazonaws.com/quest-app:latest"
  cpu               = 256
  memory            = 256
  name              = "quest-app"


  logConfiguration = {
    "logDriver" : "awslogs",
    "secretOptions" : null,
    "options" : {
      "awslogs-group" : "/ecs/quest/app",
      "awslogs-region" : "us-east-1",
      "awslogs-stream-prefix" : "ecs"
    }


  }


  portMappings = [
    {
      containerPort = 3000
      hostPort      = 3000

    },
  ]

  register_task_definition = false


}





output "quest_app_json" {
  description = "Container definition in JSON format"
  value       = "module.quest_app.json_map_encoded_list"
}






resource "aws_ecs_service" "quest_app" {
  name             = "${var.environment}-app"
  task_definition  = aws_ecs_task_definition.quest_app.arn
  cluster          = "dev-cluster"
  launch_type      = "FARGATE"
  desired_count    = 1

  



  load_balancer {
    target_group_arn = aws_alb_target_group.quest_app.id
    container_name   = "quest-app"
    container_port   = "3000"
  }

  network_configuration {

    assign_public_ip = true
   

    security_groups = [
      aws_security_group.web-alb.id

    ]

    subnets = [
      "${var.private-subnet-id}",
    ]
  }


}

resource "aws_ecs_task_definition" "quest_app" {
  family = "quest"

  container_definitions = "[${module.quest_app.container_definitions}]"
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  execution_role_arn = "arn:aws:iam::215412995827:role/ecs-execution-role"
  task_role_arn = "arn:aws:iam::215412995827:role/ecs-execution-role"
  cpu = 256
  memory = 512
  }

  */