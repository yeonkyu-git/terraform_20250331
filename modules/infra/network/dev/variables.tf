
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

# [Common variables] ------------------------------------
variable "service_code" {
  type = string
}

variable "env_name" {
  type = string
}

# [VPC variables] ------------------------------------
variable "vpc_cidr" {
  type = string
}

# [Subnet variables] ------------------------------------
variable "lb_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))
}

variable "ap_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))
}

variable "db_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))
}

# [TGW variables] ------------------------------------
variable "dmz_tgw_id" {
  type = string
}

variable "shd_tgw_id" {
  type = string
}
