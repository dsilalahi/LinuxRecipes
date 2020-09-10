variable "ec2name" {
	type = string
}

resource "aws_instance" "ec2" {
	ami = "ami-07c8bc5c1ce9598c3"
	instance_type = "t2.micro"

	tags = {
		Name = var.ec2name
	}
}