resource "aws_db_instance" "my_rds_inst" {
  engine              = "mysql"
  engine_version      = "8.0.35"
  allocated_storage   = 20
  storage_type        = "gp2"
  identifier          = "mydb"
  instance_class      = "db.t3.micro"
  username            = "root"
  password            = "kkb200229"
  skip_final_snapshot = true
  tags = {
    name = "mydbinstance"
  }

}