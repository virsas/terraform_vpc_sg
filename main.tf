resource "aws_security_group" "sg" {
    vpc_id = var.vpc_id

    tags = {
        Name = var.sg.name
    }
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.sg.rules)

  security_group_id = aws_security_group.sg.id
  type              = "ingress"

  from_port     = var.sg.rules[count.index].from
  to_port       = var.sg.rules[count.index].to
  protocol      = var.sg.rules[count.index].protocol
  cidr_blocks   = var.sg.rules[count.index].blocks
}

resource "aws_security_group_rule" "egress_rules" {
  security_group_id = aws_security_group.sg.id
  type              = "egress"

  from_port     = "0"
  to_port       = "0"
  protocol      = "-1"
  cidr_blocks   = [ "0.0.0.0/0" ]
}