locals {
  reboot_filter = coalesce(
    var.reboot_filter_override,
    var.filter_str
  )
}

module "reboot" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name                = "Sytem - Reboot detected"
  query               = "min(last_5m):derivative(max:system.uptime{${local.reboot_filter}} by {host}) < 0"
  alert_message       = "Reboot detected on ${var.service} Node {{host.name}}"
  recovery_message    = ""
  require_full_window = false

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled          = var.reboot_enabled
  alerting_enabled = var.reboot_alerting_enabled
  # no warning
  critical_threshold = 0
  priority           = var.reboot_priority
  severity           = var.reboot_severity
  docs               = var.reboot_docs
  note               = var.reboot_note
  name_prefix        = var.reboot_name_prefix
  name_suffix        = var.reboot_name_suffix
}
