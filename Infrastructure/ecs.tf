variable image_uri {}
resource "aws_ecs_task_definition" "taskdef" {
    family = "RailsTest"
    network_mode = "bridge"
    cpu = 512
    memory = 512
    container_definitions = jsonencode(
        [
            {
                name = "rails"
                image = var.image_uri
                portMappings = [
                    {
                        containerPort = 3000
                        hostPort = 80
                    }
                ]
                environment = [
                    { "name": "RAILS_ENV", "value": "production" },
                    { "name": "APP_DATABASE_HOST", "value": "${aws_db_instance.main.address}" },
                    { "name": "APP_DATABASE_USERNAME", "value": "develop" },
                    { "name": "APP_DATABASE_PASSWORD", "value": "${var.database_password}" }
                ]
            }
        ]
    )
}
