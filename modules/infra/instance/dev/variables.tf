
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

# [Instance variables] ------------------------------------
variable "keypair_name" {
  type = string
}

variable "instance_type" {
  type = string
}

# [Network variables] ------------------------------------
variable "dev_vpc_id" {
  type = string
}

variable "dev_lb_subnet_ids" {
  type = list(string)
}

variable "dev_ap_subnets" {
  type = list(string)
}

variable "dev_db_subnets" {
  type = list(string)
}

# [Security variables] ------------------------------------
variable "shd_vpc_cidr" {
  type = string
}
