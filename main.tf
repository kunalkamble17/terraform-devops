provider "aws" {
    region = "ap-northeast-1"
}

module "new-vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    project = var.project_1
    env =  var.env
    private_subnet_cidr = var.private_subnet_cidr
    public_subnet_cidr =  var.public_subnet_cidr
}
