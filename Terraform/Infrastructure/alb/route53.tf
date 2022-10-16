data "aws_route53_zone" "route53-zone" {
  name         = var.domain-name
  private_zone = false
}

resource "aws_route53_record" "route53-record" {
  zone_id = data.aws_route53_zone.route53-zone.zone_id
  name    = "www.${data.aws_route53_zone.route53-zone.name}"
  type    = "A"

  alias {
    name = aws_lb.portfolio-alb.dns_name
    #zone_id                = data.aws_route53_zone.route53-zone.zone_id
    zone_id                = aws_lb.portfolio-alb.zone_id
    evaluate_target_health = true
  }
}
