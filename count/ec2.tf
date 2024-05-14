resource "aws_instance" "db" {
    count = 3  
    ami = "ami-090252cbe067a9e58"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = var.instance_names[count.index]
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress {            # Inbound rule
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress  {            # outbound rule 
        from_port        = 0 # from 0 to 0 means, opening to all protocols
        to_port          = 0
        protocol         = "-1" # -1 means al protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }


    tags = {
        Name = "allow_ssh"
        CreatedBy = "Akhil"
    }
}
