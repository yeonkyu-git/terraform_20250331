# ===================================================
# Component: Network (gateway.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# [Internet Gateway] --------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dmz-vpc.id

  tags = {
    Name       = "IGW-AN2-${var.env_name}"
    Managed_by = "terraform"
  }
}

# [NAT Gateway] -------------------------------------
resource "aws_eip" "ngw-eip" {
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name       = "EIP-AN2-${var.env_name}-NGW"
    Managed_by = "terraform"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name       = "NGW-AN2-${var.env_name}"
    Managed_by = "terraform"
  }

  depends_on = [aws_internet_gateway.igw]
}
