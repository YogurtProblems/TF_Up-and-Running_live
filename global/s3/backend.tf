
terraform {
  backend "s3" {
    key          = "global/s3/terraform.tfstate"
    bucket       = "csousa-up-and-running"
    region       = "us-west-2"
    use_lockfile = true
    encrypt      = true


  }
}