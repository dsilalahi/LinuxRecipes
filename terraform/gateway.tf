variable "local_gateway_id" {}

data "aws_ec2_local_gateway" "selected" {
  id = var.local_gateway_id
}