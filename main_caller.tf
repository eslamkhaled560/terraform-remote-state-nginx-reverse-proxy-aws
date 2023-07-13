provider "aws" {
  region = var.region
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  igw_id = module.vpc.igw_id
  apache1_subnet_id = module.subnets.subnet_apache1_id
  apache2_subnet_id = module.subnets.subnet_apache2_id
  nginx1_subnet_id = module.subnets.subnet_nginx1_id
  nginx2_subnet_id = module.subnets.subnet_nginx2_id
}

module "instances" {
  depends_on = [module.alb.pvt_load_balancer_url]
  source = "./instances"
  vpc_id = module.vpc.vpc_id
  apache1_subnet_id = module.subnets.subnet_apache1_id
  apache2_subnet_id = module.subnets.subnet_apache2_id
  nginx1_subnet_id = module.subnets.subnet_nginx1_id
  nginx2_subnet_id = module.subnets.subnet_nginx2_id
  proxy_pass_url = module.alb.pvt_load_balancer_url
}

module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
}

module "alb" {
  source = "./load_balancers"
  subnets_pub = [module.subnets.subnet_nginx1_id, module.subnets.subnet_nginx2_id]
  subnets_pvt = [module.subnets.subnet_apache1_id, module.subnets.subnet_apache2_id]
  nginx1_id = module.instances.nginx1_id
  nginx2_id = module.instances.nginx2_id
  apache1_id = module.instances.apache1_id
  apache2_id = module.instances.apache2_id
  vpc_id = module.vpc.vpc_id
}