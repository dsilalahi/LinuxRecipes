variable "vpcname" {
	type = string
	default = "vpcterra"	
} 

variable "sshport" {
	type = number
	default = 22	
}

variable "enabled" {
	default = true	
}

variable "mylist" {
	type = list(string)
	default = ["value1", "value2"]
}

variable "mymap" {
	type = map
	default = {
		Key1 = "value1"
		Key2 = "value2"
	}
}

variable "inputname" {
	type = string
	description = "Set the name of the VPC"
}

variable "mytuple" {
	type = tuple([string, number, string])
	default = ["cat", 1, "dog"]
}


# implementation
resource "aws_vpc" "vpcterra" {
	cidr_block = "10.0.0.0/16"

	tags = {
		Name = var.vpcname  		# string
		Name = var.mylist[0]  		# list
		Name = var.mymap["Key2"]	# map
		Name = var.inputname 		# input
	}
}


output "vpcid" {
	value = aws_vpc.myvpc.id	
}
