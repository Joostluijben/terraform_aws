variable "AWS_DEFAULT_REGION" {
  type = string
   default = "eu-west-2"
}

# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region = var.AWS_DEFAULT_REGION
}

//resource "aws_ecr_repository" "test_terraform" {
//  name                 = "test_terraform"
//  image_tag_mutability = "MUTABLE"
//
//  image_scanning_configuration {
//    scan_on_push = true
//  }
//}
//
//resource "aws_ecs_cluster" "cluster_terraform" {
//  name = "cluster_terraform"
//}

data "aws_ecr_repository" "terraform" {
  name = "terraform"
}

output "test_terraform_output_url" {
  value = data.aws_ecr_repository.terraform.repository_url
}


