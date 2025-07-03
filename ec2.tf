resource "aws_instance" "k8" {
    name = var.name
    ami_id = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = var.sg_id
    
}