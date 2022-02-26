# tfmod_vpc_sg

Terraform module to create VPC security groups in AWS

## Variables

``` terraform
# name: the name of the VPC security group
# rules: ingress rules
# rules - from: From port
# rules - to: To port
# rules - protocol: TCP, UDP, ICMP
# rules - blocks: Array of blocks to allow an access to range of ports for set protocol
variable "vpc_sg_example" {
  default = {
    name = "vpc_sg_example",
    rules = [
      { from = "0", to = "0", protocol  = "-1", blocks = [ "1.1.1.1/32" ] }
    ]
  }
}
```

## Dependency

VPC <https://github.com/virsas/tfmod_vpc>

## Terraform example

``` terraform
######################
# VPC SG variables
######################
variable "vpc_sg_admin" {
  default = {
    name = "vpc_sg_example",
    rules = [
      { from = "0", to = "0", protocol  = "-1", blocks = [ "1.1.1.1/32" ] }
    ]
  }
}
######################
# VPC security groups
######################
module "vpc_sg_admin" {
  source = "github.com/virsas/tfmod_vpc_rt"
  vpc_id = module.vpc_main.id
  sg     = var.vpc_sg_admin
}
```
