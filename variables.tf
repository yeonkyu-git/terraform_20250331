# ===================================================
# Component: Variables (variables.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

#region Infrastructure Variables
variable "infrastructure" {
  type = object({
    region       = string
    access_key   = string
    secret_key   = string
    service_name = string
    service_code = string
    env_name     = string
  })
}

# [DMZ Network] -----------------------------------
variable "dmz_network" {
  type = object({
    vpc_cidr = string

    public_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))

    private_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))
  })
}

# [DEV Network] -----------------------------------
variable "dev_network" {
  type = object({
    vpc_cidr = string

    lb_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))

    ap_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))

    db_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))
  })
}

# [SHD Network] -----------------------------------
variable "shd_network" {
  type = object({
    vpc_cidr = string

    public_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))

    private_subnets = list(object({
      cidr              = string
      availability_zone = string
    }))
  })
}

# [Transit Gateway] -----------------------------------
# variable "tgw_network" {

# }


# [SHD Instance] -----------------------------------
variable "shd_instance" {
  type = object({
    keypair_name  = string
    instance_type = string
    access_ip     = list(string)
  })
}

# [DEV Instance] -----------------------------------
variable "dev_instance" {
  type = object({
    keypair_name  = string
    instance_type = string
  })
}


