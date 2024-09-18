resource "aws_instance" "instances" {

    for_each = var.instance_type
    ami = data.aws_ami.ami_info.id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.sg_group.id]

    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )

}


resource "aws_security_group" "sg_group" {

    name = "sg_group_${var.environment}"
    description = "aloow all the required ports in "

    dynamic "ingress" {
       
       for_each = var.ingress_info

       content {
          from_port = ingress.value["from_port"]
          to_port = ingress.value.to_port
          protocol = ingress.value["protocol"]
          cidr_blocks = ingress.value.cidr_blocks
       }

    }
    
    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

   tags = merge(
    var.common_tags,
    var.tags,
    {
        Name = "sg_group_${var.environment}"
    }
   )

   

}