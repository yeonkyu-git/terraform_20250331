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

# [Transit Gateway] --------------------------------
resource "aws_ec2_transit_gateway" "dmz-tgw" {

  dns_support                        = "enable"
  security_group_referencing_support = "disable"
  vpn_ecmp_support                   = "enable"
  default_route_table_association    = "disable"
  default_route_table_propagation    = "disable"
  multicast_support                  = "disable"
  auto_accept_shared_attachments     = "disable"

  tags = {
    Name       = "TGW-AN2-${var.env_name}-DMZ"
    Managed_by = "terraform"
  }
}

resource "aws_ec2_transit_gateway" "shd-tgw" {

  dns_support                        = "enable"
  security_group_referencing_support = "disable"
  vpn_ecmp_support                   = "enable"
  default_route_table_association    = "disable"
  default_route_table_propagation    = "disable"
  multicast_support                  = "disable"
  auto_accept_shared_attachments     = "disable"

  tags = {
    Name       = "TGW-AN2-${var.env_name}-SHD"
    Managed_by = "terraform"
  }
}

# [Transit Gateway Attachment] --------------------------------
resource "aws_ec2_transit_gateway_vpc_attachment" "dmz-prv-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.dmz-tgw.id
  vpc_id             = var.dmz_vpc_id
  subnet_ids         = var.dmz_private_subnets

  tags = {
    Name       = "TGW-ATTACH-AN2-${var.env_name}-DMZ-PRV"
    Managed_by = "terraform"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "dmz-dev-lb-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.dmz-tgw.id
  vpc_id             = var.dev_vpc_id
  subnet_ids         = var.dev_lb_subnets

  tags = {
    Name       = "TGW-ATTACH-AN2-${var.env_name}-DMZ-DEV-LB"
    Managed_by = "terraform"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "shd-prv-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.shd-tgw.id
  vpc_id             = var.shd_vpc_id
  subnet_ids         = var.shd_private_subnets

  tags = {
    Name       = "TGW-ATTACH-AN2-${var.env_name}-SHD-PRV"
    Managed_by = "terraform"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "shd-dev-lb-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.shd-tgw.id
  vpc_id             = var.dev_vpc_id
  subnet_ids         = var.dev_lb_subnets

  tags = {
    Name       = "TGW-ATTACH-AN2-${var.env_name}-SHD-DEV-LB"
    Managed_by = "terraform"
  }
}
