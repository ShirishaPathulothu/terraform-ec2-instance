resource "aws_instance" "k8" {
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = var.sg_id
    egress = var.egress_rule
    
}