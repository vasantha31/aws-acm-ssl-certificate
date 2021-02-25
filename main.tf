resource "aws_acm_certificate" "cert" {
  domain_name               = element(slice(var.domain_names, 0, 1), 0)
  subject_alternative_names = length(var.domain_names) > 1 ? slice(var.domain_names, 1, length(var.domain_names)) : null
  validation_method         = var.pca_arn == null ? "DNS" : null
  certificate_authority_arn = var.pca_arn
  tags                      = var.tags
}

locals {
  dv_options = var.pca_arn == null ? aws_acm_certificate.cert.domain_validation_options : []
}

data "aws_route53_zone" "zone" {
  name = var.hosted_zone
}

resource "aws_route53_record" "cert_record" {
  for_each = {
    for dvo in local.dv_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.id
  records         = [each.value.record]
  ttl             = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
  count                   = var.pca_arn == null ? 0 : 1
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_record : record.fqdn]
}
