provider "aws" {
	region = "us-east-2"
}

resource "aws_instance" "ec2" {
	ami = "ami-07c8bc5c1ce9598c3"
	instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
	instance = aws_instance.ec2.id

}

output "EIP" {
	value = aws_eip.elasticip.public_ip	
}