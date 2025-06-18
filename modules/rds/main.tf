resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "csvc-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "CSVCRDSSubnetGroup"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "csvc-rds-sg"
  description = "Allow MySQL access from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "csvc-mysql-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = true
  storage_encrypted       = true
  backup_retention_period = 7
  db_name                 = var.db_name

  tags = {
    Name = "CSVC-MySQL-RDS"
  }
}
