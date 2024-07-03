locals {
  cpu_filter = coalesce(
    var.cpu_filter_override,
    var.filter_str
  )
}

module "cpu" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name             = "System - High CPU"
  query            = "avg(${var.cpu_evaluation_period}):avg:system.cpu.user{${local.cpu_filter}} by {${var.alert_by}} + avg:system.cpu.system{${local.cpu_filter}} by {${var.alert_by}} > ${var.cpu_critical}"
  alert_message    = "High CPU usage on ${var.service} Node {{${var.alert_by}.name}} ({{value}} %)"
  recovery_message = "CPU usage on Vault ${var.service} {{${var.alert_by}.name}} Recovered ({{value}} %)"

  # monitor level vars
  enabled              = var.cpu_enabled
  alerting_enabled     = var.cpu_alerting_enabled
  warning_threshold    = var.cpu_warning
  critical_threshold   = var.cpu_critical
  priority             = min(var.cpu_priority + var.priority_offset, 5)
  docs                 = var.cpu_docs
  note                 = var.cpu_note
  notification_channel = try(coalesce(var.cpu_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
  restricted_roles     = var.restricted_roles
}
