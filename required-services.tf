locals {
  required_services_filter = coalesce(
    var.required_services_filter_override,
    var.filter_str
  )
}

module "required_services" {
  source   = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"
  for_each = var.required_services_config

  name  = "System - ${upper(substr(each.key, 0, 1))}${substr(each.key, 1, length(each.key) - 1)} service not running"
  type  = "process alert"
  query = "processes('').over('${local.required_services_filter},command:${each.key}').by('host').rollup('count').last('${lookup(each.value, "freshness_duration", var.required_services_default_freshness_duration)}') < ${lookup(each.value, "process_count", 1)}"

  alerting_enabled = var.required_services_alerting_enabled

  alert_message    = "${each.key} service not running on ${var.service} Node {{host.name}}"
  recovery_message = "${each.key} is back on ${var.service} Node {{host.name}}"

  service         = var.service
  env             = var.alert_env
  priority        = var.required_services_default_priority
  severity        = var.required_services_default_severity
  note            = var.required_services_default_note
  docs            = var.required_services_default_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false
  locked              = var.locked

  critical_threshold = lookup(each.value, "process_count", 1)
}
