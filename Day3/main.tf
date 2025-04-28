module "Network" {
  source = "./network"
  subnets = var.subnets
  vpc_cidr = var.vpc_cidr
  region = var.region
}

