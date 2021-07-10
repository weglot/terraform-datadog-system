# system.net.packets_in.error
# https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/

locals {
  packets_in_errors_filter = coalesce(
    var.packets_in_errors_filter_override,
    var.filter_str
  )
}

module "packets_in_errors" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name = "System - Packet In Errors"
  # +1000 helps out filtering low packet rates, this prevents a handful of packet errors to skew the percentage when for example only 100 packets are received/sent
  query            = "avg(${var.packets_in_errors_evaluation_period}):100 * max:system.net.packets_in.error{${local.packets_in_errors_filter}} by {host} / ( max:system.net.packets_in.count{${local.packets_in_errors_filter}} by {host} + 1000 ) > ${var.packets_in_errors_critical}"
  alert_message    = "High rate of packet-in errors on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "Packet-in error rate on ${var.service} Node {{host.name}} Recovered ({{value}} %)"

  # monitor level vars
  enabled            = var.packets_in_errors_enabled
  alerting_enabled   = var.packets_in_errors_alerting_enabled
  warning_threshold  = var.packets_in_errors_warning
  critical_threshold = var.packets_in_errors_critical
  priority           = var.packets_in_errors_priority
  docs               = var.packets_in_errors_docs
  note               = var.packets_in_errors_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
