# terraform_vpc_sg

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

VPC <https://github.com/virsas/terraform_vpc>

## Terraform example

``` terraform
######################
# VPC SG variables
######################
variable "vpc_sg_example" {
  default = {
    name = "vpc_sg_example",
    rules = [
      { from = "3306", to = "3306", protocol  = "TCP", blocks = [ "10.0.0.0/24", "10.0.1.0/24" ] },
      { from = "5432", to = "5432", protocol  = "TCP", blocks = [ "10.0.0.0/24" ] },
      { from = "22", to = "22", protocol  = "TCP", blocks = [ "1.1.1.1/32" ] }
    ]
  }
}
######################
# VPC security groups
######################
module "vpc_sg_admin" {
  source = "github.com/virsas/terraform_vpc_sg"
  vpc_id = module.vpc_main.id
  sg     = var.vpc_sg_example
}
```
