# ===================================================
# Component: Network (route_tables.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# [Public Route Table] ------------------------------
resource "aws_route_table" "PRB-RT" {
  vpc_id = aws_vpc.shd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name       = "RT-AN2-${var.env_name}-PRB"
    Managed_by = "terraform"
  }
}

resource "aws_route_table_association" "PRB-AC-1" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.PRB-RT.id
}

resource "aws_route_table_association" "PRB-AC-2" {
  subnet_id      = aws_subnet.public[1].id
  route_table_id = aws_route_table.PRB-RT.id
}


# [Private Route Table] ------------------------------
resource "aws_route_table" "PRV-RT" {
  vpc_id = aws_vpc.shd-vpc.id

  route {
    cidr_block = "10.35.77.0/24"
    gateway_id = var.shd_tgw_id
  }

  tags = {
    Name       = "RT-AN2-${var.env_name}-PRV"
    Managed_by = "terraform"
  }

}

resource "aws_route_table_association" "PRV-AC-1" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.PRV-RT.id
}

resource "aws_route_table_association" "PRV-AC-2" {
  subnet_id      = aws_subnet.private[1].id
  route_table_id = aws_route_table.PRV-RT.id
}
