variable database_password {}

resource "aws_db_instance" "main" {
  name                 = "RailsTest"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "develop"
  password             = var.database_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "db_inst_subnet_group" {
  name       = "rails_test"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}
