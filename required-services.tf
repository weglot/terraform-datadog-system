locals {
  required_services_filter = coalesce(
    var.required_services_filter_override,
    var.filter_str
  )
}

module "required_services" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  for_each = var.required_services_config

  name                = "System - Service ${lookup(each.value, "display_name", title(each.key))}"
  type                = "process alert"
  query               = "processes('${each.key}').over('${local.required_services_filter}').by('host').rollup('count').last('${lookup(each.value, "freshness_duration", var.required_services_default_freshness_duration)}') < ${lookup(each.value, "process_count", 1)}"
  alert_message       = "Service ${lookup(each.value, "display_name", "")} ${each.key} not running on ${var.service} Node {{${var.alert_by}.name}}"
  recovery_message    = "${each.key} is back on ${var.service} Node {{${var.alert_by}.name}}"
  require_full_window = false

  # monitor level vars
  enabled          = var.required_services_enabled
  alerting_enabled = var.required_services_alerting_enabled
  # no warning
  critical_threshold   = lookup(each.value, "process_count", 1)
  priority             = min(var.required_services_default_priority + var.priority_offset, 5)
  note                 = lookup(each.value, "note", var.required_services_default_note)
  docs                 = lookup(each.value, "docs", var.required_services_default_docs)
  notification_channel = try(coalesce(var.required_services_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
