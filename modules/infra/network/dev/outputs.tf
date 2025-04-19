
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

output "vpc_id" {
  description = "The ID of VPC"
  value       = aws_vpc.dev-vpc.id
}

output "dev_lb_subnet_ids" {
  description = "The List of DEV LB Subnet ID of VPC"
  value       = aws_subnet.lb-sbn.*.id
}

output "dev_ap_subnet_ids" {
  description = "The List of DEV AP Subnet ID of VPC"
  value       = aws_subnet.ap-sbn.*.id
}

output "dev_db_subnet_ids" {
  description = "The List of DEV DB Subnet ID of VPC"
  value       = aws_subnet.db-sbn.*.id
}
