
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


# [Network variables] ------------------------------------
variable "dmz_vpc_id" {
  type = string
}

variable "dmz_private_subnets" {
  type = list(string)
}

variable "shd_vpc_id" {
  type = string
}

variable "shd_private_subnets" {
  type = list(string)
}

variable "dev_vpc_id" {
  type = string
}

variable "dev_lb_subnets" {
  type = list(string)
}
