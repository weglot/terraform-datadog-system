locals {
  packets_out_errors_filter = coalesce(
    var.packets_out_errors_filter_override,
    var.filter_str
  )
}

module "packets_out_errors" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"

  name  = "System - Packet Out Errors"
  query = "avg(${var.packets_out_errors_evaluation_period}):100 * max:system.net.packets_out.error{${local.packets_out_errors_filter}} by {host} / max:system.net.packets_out.count{${local.packets_out_errors_filter}} by {host} > ${var.packets_out_errors_critical}"

  enabled          = var.packets_out_errors_enabled
  alerting_enabled = var.packets_out_errors_alerting_enabled

  alert_message    = "High rate of packet-out errors on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "Packet-out error rate on ${var.service} Node {{host.name}} Recovered ({{value}} %)"

  service         = var.service
  env             = var.alert_env
  priority        = var.packets_out_errors_priority
  severity        = var.packets_out_errors_severity
  note            = var.packets_out_errors_note
  docs            = var.packets_out_errors_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.packets_out_errors_critical
  warning_threshold  = var.packets_out_errors_warning
}
