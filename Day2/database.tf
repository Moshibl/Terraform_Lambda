resource "aws_db_instance" "RDS" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "12345678"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
  skip_final_snapshot  = true
}

resource "aws_elasticache_serverless_cache" "REDIS" {
  engine = "redis"
  name   = "redis"
  cache_usage_limits {
    data_storage {
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }
  daily_snapshot_time      = "09:00"
  description              = "Test Server"
  kms_key_id               = aws_kms_key.kms-key.arn
  major_engine_version     = "7"
  snapshot_retention_limit = 1
  security_group_ids       = [aws_security_group.PrivSG.id]
  subnet_ids               = [aws_subnet.subnets["private_subnet1"].id, aws_subnet.subnets["private_subnet2"].id]
}