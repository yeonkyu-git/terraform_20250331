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

# [Public Subnet] -----------------------------------
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.dmz-vpc.id
  cidr_block        = lookup(var.public_subnets[count.index], "cidr")
  availability_zone = lookup(var.public_subnets[count.index], "availability_zone")

  tags = {
    Name       = "SBN-AN2A-${var.env_name}-PRB-${count.index}"
    Managed_by = "terraform"
  }
}

# [Private Subnet] -----------------------------------
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.dmz-vpc.id
  cidr_block        = lookup(var.private_subnets[count.index], "cidr")
  availability_zone = lookup(var.private_subnets[count.index], "availability_zone")

  tags = {
    Name       = "SBN-AN2A-${var.env_name}-PRV-${count.index}"
    Managed_by = "terraform"
  }
}
