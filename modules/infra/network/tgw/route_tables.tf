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

# [Transit Gateway Route Table] --------------------------------
resource "aws_ec2_transit_gateway_route_table" "dmz-dev-rt" {
  transit_gateway_id = aws_ec2_transit_gateway.dmz-tgw.id

  tags = {
    Name       = "TGW-RT-AN2-${var.env_name}-DMZ-DEV"
    Managed_by = "terraform"
  }
}

resource "aws_ec2_transit_gateway_route_table" "shd-dev-rt" {
  transit_gateway_id = aws_ec2_transit_gateway.shd-tgw.id

  tags = {
    Name       = "TGW-RT-AN2-${var.env_name}-SHD-DEV"
    Managed_by = "terraform"
  }
}

# [Transit Gateway Association] --------------------------------
resource "aws_ec2_transit_gateway_route_table_association" "dmz-tgw-asso" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dmz-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.dmz-prv-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "dmz-dev-tgw-asso" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dmz-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.dmz-dev-lb-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "shd-tgw-asso" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shd-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shd-prv-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "shd-dev-tgw-asso" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shd-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shd-dev-lb-tgw-attachment.id
}

# [Transit Gateway Propagation] --------------------------------
resource "aws_ec2_transit_gateway_route_table_propagation" "dmz-tgw-propa" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dmz-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.dmz-prv-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "dmz-dev-tgw-propa" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dmz-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.dmz-dev-lb-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "shd-tgw-propa" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shd-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shd-prv-tgw-attachment.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "shd-dev-tgw-propa" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shd-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shd-dev-lb-tgw-attachment.id
}

# [Transit Gateway Route] --------------------------------
resource "aws_ec2_transit_gateway_route" "dmz-all-route" {

  destination_cidr_block = "0.0.0.0/0"

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dmz-dev-rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.dmz-prv-tgw-attachment.id
}


