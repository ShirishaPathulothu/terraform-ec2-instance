resource "aws_instance" "k8" {
    name = var.name
    ami = data.aws_ami.ami_info.id
    instance_type = "t3.micro"
    vpc_security_group_ids = var.sg_id
    
}