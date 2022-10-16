resource "aws_security_group" "compute" {
  name   = "${var.environment_name}-PD-COMPUTE"
  vpc_id = module.vpc.vpc_id

  ingress {
    description      = "SSL"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "edge" {
  name   = "${var.environment_name}-PD-SFTP"
  vpc_id = module.vpc.vpc_id

  ingress {
    description      = "SSL"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "data" {
  name   = "${var.environment_name}-PD-RDS"
  vpc_id = module.vpc.vpc_id

  ingress {
    description      = "SSL"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "PostgreSQL"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}