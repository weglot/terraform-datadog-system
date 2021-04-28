locals {
  reboot_filter = coalesce(
    var.reboot_filter_override,
    var.filter_str
  )
}

module "uptime" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.4"

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
  enabled          = var.cpu_enabled
  alerting_enabled = var.cpu_alerting_enabled
  # no warning
  critical_threshold = 0
  priority           = var.cpu_priority
  severity           = var.cpu_severity
  docs               = var.cpu_docs
  note               = var.cpu_note
  name_prefix        = var.cpu_name_prefix
  name_suffix        = var.cpu_name_suffix
}
