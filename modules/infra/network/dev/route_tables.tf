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

# [LB Route Table] ------------------------------
resource "aws_route_table" "LB-RT" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name       = "RT-AN2-${var.env_name}-LB"
    Managed_by = "terraform"
  }
}

resource "aws_route_table_association" "LB-AC-1" {
  subnet_id      = aws_subnet.lb-sbn[0].id
  route_table_id = aws_route_table.LB-RT.id
}

resource "aws_route_table_association" "LB-AC-2" {
  subnet_id      = aws_subnet.lb-sbn[1].id
  route_table_id = aws_route_table.LB-RT.id
}


# [AP Route Table] ------------------------------
resource "aws_route_table" "AP-RT" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.dmz_tgw_id
  }

  route {
    cidr_block = "10.35.78.0/25"
    gateway_id = var.shd_tgw_id
  }

  tags = {
    Name       = "RT-AN2-${var.env_name}-AP"
    Managed_by = "terraform"
  }
}

resource "aws_route_table_association" "AP-AC-1" {
  subnet_id      = aws_subnet.ap-sbn[0].id
  route_table_id = aws_route_table.AP-RT.id
}

resource "aws_route_table_association" "AP-AC-2" {
  subnet_id      = aws_subnet.ap-sbn[1].id
  route_table_id = aws_route_table.AP-RT.id
}

# [DB Route Table] ------------------------------
resource "aws_route_table" "DB-RT" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name       = "RT-AN2-${var.env_name}-DB"
    Managed_by = "terraform"
  }
}

resource "aws_route_table_association" "DB-AC-1" {
  subnet_id      = aws_subnet.db-sbn[0].id
  route_table_id = aws_route_table.DB-RT.id
}

resource "aws_route_table_association" "DB-AC-2" {
  subnet_id      = aws_subnet.db-sbn[1].id
  route_table_id = aws_route_table.DB-RT.id
}
