# ===================================================
# Component: Advanced (ec2.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# [Bastion Instance] -----------------------------------
resource "aws_instance" "bastion-instance" {
  ami           = data.aws_ami.al.id
  instance_type = var.instance_type
  key_name      = var.keypair_name

  associate_public_ip_address = true
  subnet_id                   = element(var.shd_public_subnets, 0)
  vpc_security_group_ids      = [aws_security_group.sbstap01-sg.id]


  tags = {
    Name       = "EC2-AN2A-${var.env_name}-sbstap01"
    Managed_by = "terraform"
    Schedule   = "off-at-18"
  }
}
