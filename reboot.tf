locals {
  reboot_filter = coalesce(
    var.reboot_filter_override,
    var.filter_str
  )
}

module "reboot" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name                = "Sytem - Reboot detected"
  query               = "min(last_5m):derivative(max:system.uptime{${local.reboot_filter}} by {${var.alert_by}}) < 0"
  alert_message       = "Reboot detected on ${var.service} Node {{host.name}}"
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
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
