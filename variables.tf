variable "sg_id" {
    type = list(string)
    default = ["sg-0f81b4954c6b01728"]

}

variable "public_subnet_id" {
    type = string
    default = "subnet-04b690ffdaa49022a"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "user_data" {
    type = string
}

variable "tags" {
    default = {
        Name = "workstation"
    }
}

variable "name" {
    type = string
    default = "workstation"
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "egress_rule" {
    default = [({
                 from_port = 0
                 to_port = 0
                 protocol = -1
                 cidr_blocks = ["0.0.0.0/0"]
                 ipv6_cidr_blocks = ["::/0"]
            })]
}