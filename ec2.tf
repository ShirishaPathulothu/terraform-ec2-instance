resource "aws_instance" "k8" {
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = var.sg_id

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    
  }
    
}