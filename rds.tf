resource "aws_db_instance" "postgres" {
  identifier             = "${var.environment_name}-postgres"
  db_name                = var.db_name
  instance_class         = "db.t3.small"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "13.7"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.data.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
  username               = var.db_user
  password               = var.db_password
}

resource "aws_db_subnet_group" "default" {
  name       = "postgres"
  subnet_ids = concat(module.vpc.private_subnets, module.vpc.public_subnets)

  tags = {
    Name = "${var.environment_name}-postgres"
  }
}