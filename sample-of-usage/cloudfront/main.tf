module "cloufront" {
  source  = "../../modules/cloudfront"

  name    = "Cloudfront dev"
  origin = "${data.terraform_remote_state.asg.this_elb_dns_name}"
  aliases = []

  custom_origin_config = [{
    http_port = 80
    https_port = 443
    origin_protocol_policy = "match-viewer"
    origin_ssl_protocols = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    origin_read_timeout = 60
  }]

  forwarded_headers = ["Host"]
  tags {
    App = "Application"
    Environment = "dev"
  }
  #certificate = "${var.certificate_arn}"
}