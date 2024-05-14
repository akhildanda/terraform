output "ami_id" { 
 value = data.aws_ami.ami_id.state
}

output "default" {
    value = data.aws_vpc.default
}

