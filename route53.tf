# Zone
resource "aws_route53_zone" "electric-mayhem" {
    name = "electric-mayhem.org"
}

# MX records
resource "aws_route53_record" "mx" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "${aws_route53_zone.electric-mayhem.name}"
    type = "MX"
    ttl = "60"
    records = ["10 bigboote.electric-mayhem.org"]
}

# AAAA records
# A records
resource "aws_route53_record" "top" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "${aws_route53_zone.electric-mayhem.name}"
    type = "A"
    ttl = "60"
    records = ["162.243.86.29"]
}
resource "aws_route53_record" "bigboote" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "bigboote.electric-mayhem.org"
    type = "A"
    ttl = "60"
    records = ["162.243.250.218"]
}
resource "aws_route53_record" "planet10" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "planet10.electric-mayhem.org"
    type = "A"
    ttl = "60"
    records = ["162.243.86.29"]
}
# whorfin 162.243.89.29

# CNAME records
resource "aws_route53_record" "www" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "www.electric-mayhem.org"
    type = "CNAME"
    ttl = "60"
    records = ["planet10.electric-mayhem.org"]
}
resource "aws_route53_record" "foom" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "foom.electric-mayhem.org"
    type = "CNAME"
    ttl = "60"
    records = ["planet10.electric-mayhem.org"]
}

# Home wildcard
resource "aws_route53_record" "home" {
    zone_id = "${aws_route53_zone.electric-mayhem.zone_id}"
    name = "*.home.electric-mayhem.org"
    type = "CNAME"
    ttl = "60"
    records = ["electric-mayhem.dyndns.org"]
}
