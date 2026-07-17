locals {
  security_groups = {
    web = "Web traffic"
    ssh = "SSH access"
  }
}

resource "aws_security_group" "extra" {
  for_each = local.security_groups

  name        = "${var.name_prefix}-${each.key}"
  description = each.value
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.key
  }
}