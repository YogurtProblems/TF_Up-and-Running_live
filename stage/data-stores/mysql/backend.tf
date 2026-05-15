terraform {
  backend "s3" {
    bucket       = "csousa-up-and-running"
    key          = "stage/data-stores/mysql/terraform.tfstate"
    region       = "us-west-2"
    use_lockfile = true
    encrypt      = true



  }
}