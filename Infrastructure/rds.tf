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
    publicly_accessible  = true
    db_subnet_group_name = aws_db_subnet_group.db_subnet.name
    vpc_security_group_ids = [aws_security_group.db_sg.id]
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "rails_test_db_subnet_group"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}

resource "aws_security_group" "db_sg" {
    name = "RailsTest_RDB"
    description = "RDB"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port        = 3306
        to_port          = 3306
        protocol         = "TCP"
        security_groups  = [aws_security_group.ecs_instance_sg.id]
    }

    egress {
        from_port        = 3306
        to_port          = 3306
        protocol         = "TCP"
        security_groups  = [aws_security_group.ecs_instance_sg.id]
    }
}

resource "aws_db_subnet_group" "db_inst_subnet_group" {
  name       = "rails_test"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}
