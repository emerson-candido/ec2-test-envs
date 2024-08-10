module "remoteState" {
    source = "./modules/remoteState"

    env     = var.env
    product = var.product
    region  = var.region
}

module "network" {
    source = "./modules/network"

    env                  = var.env
    product              = var.product
    region               = var.region
    routes               = var.routes
    security_group_rules = var.security_group_rules
    subnet               = var.subnet
    vpc                  = var.vpc

    depends_on = [ module.remoteState ]
}

module "compute" {
    source = "./modules/compute"

    az                 = module.network.subnet_az
    compute            = var.compute
    env                = var.env
    product            = var.product
    region             = var.region
    security_group_ids = [ module.network.security_group_id ]
    subnet_id          = module.network.subnet_id

    depends_on = [
        module.network,
        module.remoteState
    ]
}
