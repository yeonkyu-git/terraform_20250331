
# ===================================================
# Component: Network (outputs.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

output "dmz_tgw_id" {
  description = "The ID of DMZ TGW"
  value       = aws_ec2_transit_gateway.dmz-tgw.id
}

output "shd_tgw_id" {
  description = "The ID of DMZ TGW"
  value       = aws_ec2_transit_gateway.shd-tgw.id
}
