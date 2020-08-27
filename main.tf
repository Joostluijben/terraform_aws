# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
}

resource "aws_ecr_repository" "test_terraform" {
  name                 = "test_terraform"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecs_cluster" "cluster_terraform" {
  name = "cluster_terraform"
}

output "test_terraform_output_url" {
  value = aws_ecr_repository.test_terraform.repository_url
}
