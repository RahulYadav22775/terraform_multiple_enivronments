# resource "aws_route53_record" "type_A_records" {
    
#     for_each = aws_instance.instances
#     zone_id = var.zone_id
#     name = "${each.key}.${var.domain_name}"
#     type = "A"
#     ttl = 1
#     records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
#     allow_overwrite = true

# }

resource "aws_route53_record" "type_A_records" {
    
    for_each = aws_instance.instances
    zone_id = var.zone_id
    name = startswith(each.key,"frontend") ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true

}