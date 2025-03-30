resource "aws_vpc" "myvpc" {
  cidr_block         = var.cidr
  enable_dns_support = "false"
   enable_dns_hostnames = true 

}