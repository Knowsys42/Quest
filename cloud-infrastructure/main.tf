
# Setting TF state to be in S3. Using primary AWS config on local machine
terraform {
  backend "s3" {
    bucket  = "derek-quest-tf-state"
    key     = "derek-quest-tf-state.tfstate"
    region  = "us-east-1"
    encrypt = true

  }
}

# Setting Provider to AWS
provider "aws" {
  region = "us-east-1"


}




# Point Infrastructure modules to correct file path
module "quest-infrastructure" {
  source      = "./modules/infrastructure"
  environment = var.environment





}












