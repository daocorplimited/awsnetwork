data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name                 = "${var.environment_name}-vpc"
  cidr                 = var.cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_vpc_endpoint" "sqs" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.sqs"
  vpc_endpoint_type = "Interface"
}

#resource "aws_route_table" "public_rt" {
#  vpc_id = module.vpc.vpc_id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = module.vpc.igw_id
#  }
#}

#resource "aws_route_table_association" "a" {
#  count = length(module.vpc.public_subnets)
#  subnet_id = element(module.vpc.public_subnets[*],count.index)
#  route_table_id = aws_route_table.public_rt.id
#}