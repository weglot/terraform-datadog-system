# system.net.packets_in.error
# https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/

locals {
  packets_in_errors_filter = coalesce(
    var.packets_in_errors_filter_override,
    var.filter_str
  )
}

module "packets_in_errors" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.2"

  name  = "System - Packet In Errors"
  query = "avg(${var.packets_in_errors_evaluation_period}):100 * max:system.net.packets_in.error{${local.packets_in_errors_filter}} by {host} / max:system.net.packets_in.count{${local.packets_in_errors_filter}} by {host} > ${var.packets_in_errors_critical}"

  enabled          = var.packets_in_errors_enabled
  alerting_enabled = var.packets_in_errors_alerting_enabled

  alert_message    = "High rate of packet-in errors on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "Packet-in error rate on ${var.service} Node {{host.name}} Recovered ({{value}} %)"

  service         = var.service
  env             = var.alert_env
  severity        = var.packets_in_errors_severity
  note            = var.packets_in_errors_note
  docs            = var.packets_in_errors_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = var.packets_in_errors_critical
  warning_threshold  = var.packets_in_errors_warning
}
