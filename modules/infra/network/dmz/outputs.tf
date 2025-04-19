
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
  value       = aws_vpc.dmz-vpc.id
}

output "public_subnet_ids" {
  description = "The List of Public Subnet ID of VPC"
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "The List of Private Subnet ID of VPC"
  value       = aws_subnet.private.*.id
}
