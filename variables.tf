variable "public_subnet_id" {
    type = string
    default = "subnet-04b690ffdaa49022a"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}


variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "sg_name" {
    default = "allow-all"
}

variable "tags" {
    type = map
    default = {
        Name = "workstation"
    }
}

variable "user_data" {
    type = string
}