module "network" {
  source = "./modules/network"

  environment = var.environment
}


module "compute" {
  source = "./modules/compute"

  environment = var.environment
  name        = "${var.environment}"

  vpc-id         = module.network.vpc-id
  vpc-cidr-block = module.network.vpc-cidr-block

  public-subnet-id  = module.network.public-subnet-id
  public2-subnet-id = module.network.public2-subnet-id
  private-subnet-id = module.network.private-subnet-id
  
}


