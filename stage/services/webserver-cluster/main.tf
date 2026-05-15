provider "aws" {
  region = "us-west-2"

}
module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "csousa-up-and-running"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_name    = "t3.micro"
  min_size         = 2
  max_size         = 2
  desired_capacity = 2

}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver-cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}