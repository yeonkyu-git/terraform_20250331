# ===================================================
# Component: Advanced (sg.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

# [Bastion Instance Security Group]
// Security Group - Bastion Host
resource "aws_security_group" "dtstap01-sg" {
  description = "DEV TEST AP Server SG"
  vpc_id      = var.dev_vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name       = "SCG-AN2A-${var.env_name}-dtstap01-EC2"
    Managed_by = "terraform"
  }
}

resource "aws_security_group_rule" "sbstap01-sg-ssh-rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.shd_vpc_cidr]
  security_group_id = aws_security_group.dtstap01-sg.id
}
