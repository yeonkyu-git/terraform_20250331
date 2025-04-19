# ===================================================
# Component: Network (subnet.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# [LB Subnet] -----------------------------------
resource "aws_subnet" "lb-sbn" {
  count = length(var.lb_subnets)

  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = lookup(var.lb_subnets[count.index], "cidr")
  availability_zone = lookup(var.lb_subnets[count.index], "availability_zone")

  tags = {
    Name       = "SBN-AN2A-${var.env_name}-LB-${count.index}"
    Managed_by = "terraform"
  }
}

# [AP Subnet] -----------------------------------
resource "aws_subnet" "ap-sbn" {
  count = length(var.ap_subnets)

  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = lookup(var.ap_subnets[count.index], "cidr")
  availability_zone = lookup(var.ap_subnets[count.index], "availability_zone")

  tags = {
    Name       = "SBN-AN2A-${var.env_name}-AP-${count.index}"
    Managed_by = "terraform"
  }
}

# [DB Subnet] -----------------------------------
resource "aws_subnet" "db-sbn" {
  count = length(var.db_subnets)

  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = lookup(var.db_subnets[count.index], "cidr")
  availability_zone = lookup(var.db_subnets[count.index], "availability_zone")

  tags = {
    Name       = "SBN-AN2A-${var.env_name}-DB-${count.index}"
    Managed_by = "terraform"
  }
}
