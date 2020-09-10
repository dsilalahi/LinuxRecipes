

- For local state, Terraform stores the workspace states in a directory called terraform.tfstate.d. 


```
terraform console


# create a new workspace
terraform workspace new <ws name>

# switch to a workspace
terraform workspace select <ws name>


# checks configuration is syntactically valid and internally consistent
terraform validate

# check canonical format between TF versions
terraform fmt

# view the specified version constraints for all providers used in the current configuration
terraform providers

# import from existing ec2
terraform import aws_instance.<ec2name> <image-id>

# list of resources in state file
terraform state list
```


```
lookup({a="val1", b="val2"}, "c", "default")
# result: "default"

# rename an EC2 instance without destroying and recreating
terraform state mv
```