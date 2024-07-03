locals {
  reboot_filter = coalesce(
    var.reboot_filter_override,
    var.filter_str
  )
}

module "reboot" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name                = "System - Reboot detected"
  query               = "min(last_5m):derivative(max:system.uptime{${local.reboot_filter}} by {${var.alert_by}}) < 0"
  alert_message       = "Reboot detected on ${var.service} Node {{${var.alert_by}.name}}"
  recovery_message    = ""
  require_full_window = false

  # monitor level vars
  enabled          = var.reboot_enabled
  alerting_enabled = var.reboot_alerting_enabled
  # no warning
  critical_threshold   = 0
  priority             = min(var.reboot_priority + var.priority_offset, 5)
  docs                 = var.reboot_docs
  note                 = var.reboot_note
  notification_channel = try(coalesce(var.reboot_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
  restricted_roles     = var.restricted_roles
}
