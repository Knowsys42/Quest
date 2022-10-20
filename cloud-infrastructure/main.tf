

terraform {
  backend "s3" {
    bucket  = "derek-quest-tf-state"
    key     = "derek-quest-tf-state.tfstate"
    region  = "us-east-1"
    encrypt = true

  }
}


provider "aws" {
  region = "us-east-1"


}





module "quest-infrastructure" {
  source      = "./modules/infrastructure"
  environment = var.environment





}












