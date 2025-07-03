resource "aws_instance" "k8" {
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = var.sg_id

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
    
}