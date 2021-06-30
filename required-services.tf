locals {
  required_services_filter = coalesce(
    var.required_services_filter_override,
    var.filter_str
  )
}

module "required_services" {
  source   = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2.rc1"
  for_each = var.required_services_config

  name                = "System - ${upper(substr(each.key, 0, 1))}${substr(each.key, 1, length(each.key) - 1)} service not running"
  type                = "process alert"
  query               = "processes('').over('${local.required_services_filter},command:${each.key}').by('host').rollup('count').last('${lookup(each.value, "freshness_duration", var.required_services_default_freshness_duration)}') < ${lookup(each.value, "process_count", 1)}"
  alert_message       = "${each.key} service not running on ${var.service} Node {{host.name}}"
  recovery_message    = "${each.key} is back on ${var.service} Node {{host.name}}"
  require_full_window = false

  # monitor level vars
  enabled          = var.required_services_enabled
  alerting_enabled = var.required_services_alerting_enabled
  # no warning
  critical_threshold = lookup(each.value, "process_count", 1)
  priority           = var.required_services_default_priority
  note               = var.required_services_default_note
  docs               = var.required_services_default_docs

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
