# ===================================================
# Component: Advanced (main.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# region NETWORK 
# [DMZ Network] -----------------------------------
module "dmz_network" {
  # Common  
  source = "./modules/infra/network/dmz"

  service_code = "NW"
  env_name     = "DMZ"

  # Network
  vpc_cidr        = var.dmz_network.vpc_cidr
  public_subnets  = var.dmz_network.public_subnets
  private_subnets = var.dmz_network.private_subnets
  dmz_tgw_id      = module.tgw_network.dmz_tgw_id
}

# [DEV Network] -----------------------------------
module "dev_network" {
  # Common  
  source = "./modules/infra/network/dev"

  service_code = "NW"
  env_name     = "DEV"

  # Network
  vpc_cidr   = var.dev_network.vpc_cidr
  lb_subnets = var.dev_network.lb_subnets
  ap_subnets = var.dev_network.ap_subnets
  db_subnets = var.dev_network.db_subnets
  dmz_tgw_id = module.tgw_network.dmz_tgw_id
  shd_tgw_id = module.tgw_network.shd_tgw_id
}

# [SHD Network] -----------------------------------
module "shd_network" {
  # Common  
  source = "./modules/infra/network/shd"

  service_code = "NW"
  env_name     = "SHD"

  # Network
  vpc_cidr        = var.shd_network.vpc_cidr
  public_subnets  = var.shd_network.public_subnets
  private_subnets = var.shd_network.private_subnets
  shd_tgw_id      = module.tgw_network.shd_tgw_id
}


# [Transit Gateway] -----------------------------------
module "tgw_network" {
  # Common  
  source = "./modules/infra/network/tgw"

  service_code = "NW"
  env_name     = "COM"

  # VPC 
  dmz_vpc_id          = module.dmz_network.vpc_id
  dmz_private_subnets = module.dmz_network.private_subnet_ids
  shd_vpc_id          = module.shd_network.vpc_id
  shd_private_subnets = module.shd_network.private_subnet_ids
  dev_vpc_id          = module.dev_network.vpc_id
  dev_lb_subnets      = module.dev_network.dev_lb_subnet_ids
}



# region INSTANCE
# [SHD Server] -----------------------------------
module "shd_instance" {
  # Common  
  source = "./modules/infra/instance/shd"

  service_code = "NW"
  env_name     = "SHD"

  # Instance
  keypair_name        = var.shd_instance.keypair_name
  instance_type       = var.shd_instance.instance_type
  shd_vpc_id          = module.shd_network.vpc_id
  shd_public_subnets  = module.shd_network.public_subnet_ids
  shd_private_subnets = module.shd_network.private_subnet_ids

  # etc
  access_ip = var.shd_instance.access_ip
}

# [DEV Server] -----------------------------------
module "dev_instance" {
  # Common  
  source = "./modules/infra/instance/dev"

  service_code = "NW"
  env_name     = "DEV"

  # Instance
  keypair_name      = var.dev_instance.keypair_name
  instance_type     = var.dev_instance.instance_type
  dev_vpc_id        = module.dev_network.vpc_id
  dev_lb_subnet_ids = module.dev_network.dev_lb_subnet_ids
  dev_ap_subnets    = module.dev_network.dev_ap_subnet_ids
  dev_db_subnets    = module.dev_network.dev_db_subnet_ids

  # Security
  shd_vpc_cidr = var.shd_network.vpc_cidr
}
