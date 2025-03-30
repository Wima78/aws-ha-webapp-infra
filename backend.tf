terraform {
  backend "s3" {
    bucket         = "wima-print-backet"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sprints"

  }
}

