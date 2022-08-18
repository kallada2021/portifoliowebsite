data "aws_route53_zone" "route53-zone" {
  name         = "domain.com."
  private_zone = true
}

resource "aws_route53_record" "route53-record" {
  zone_id = data.aws_route53_zone.route53-zone.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_lb.portfolio-alb.dns_name]
}
