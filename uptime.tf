locals {
  reboot_filter = coalesce(
    var.reboot_filter_override,
    var.filter_str
  )
}

module "uptime" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.2"

  name  = "Sytem - Reboot detected"
  query = "min(last_5m):derivative(max:system.uptime{${local.reboot_filter}} by {host}) < 0"

  enabled          = var.reboot_enabled
  alerting_enabled = var.reboot_alerting_enabled

  alert_message    = "Reboot detected on ${var.service} Node {{host.name}}"
  recovery_message = ""

  service         = var.service
  env             = var.alert_env
  severity        = var.reboot_severity
  note            = var.reboot_note
  docs            = var.reboot_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false

  critical_threshold = 0
}
