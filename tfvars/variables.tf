variable "instance_type" {
    type = map
}

#common tags
variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
    }
}


variable "tags" {

}



variable "environment" {

}


#dynamic ingress blocks
variable "ingress_info" {

    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow port no 22"
        },

        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow port no 80"
        },

        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow port no 8080"
        }
    ]

    
}


variable "zone_id" {
    default = "Z0899670238D02XK0M9FO"
    type = string
 }

 #variable for domain name
 variable "domain_name" {
    default = "gopi-81s.online"
    type = string
 }