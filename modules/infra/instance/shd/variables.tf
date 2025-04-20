
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
variable "shd_vpc_id" {
  type = string
}

variable "shd_public_subnets" {
  type = list(string)
}

variable "shd_private_subnets" {
  type = list(string)
}

# [ETC variables] ------------------------------------
variable "access_ip" {
  type = list(string)
}
