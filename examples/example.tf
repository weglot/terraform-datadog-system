module "system" {
  source = "kabisa/system/datadog"

  notification_channel       = "mail@example.com"
  service                    = "ServiceX"
  env                        = "prd"
  filter_str                 = "host:myserver"
  service_check_include_tags = ["host:myserver"]
}
