resource "aws_ecr_repository" "repo" {
  name = "${var.project_name}-${var.environment}"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = var.project_name
    Env = var.environment
  }
}