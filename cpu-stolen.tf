locals {
  cpu_stolen_filter = coalesce(
    var.cpu_stolen_filter_override,
    var.filter_str
  )
}

module "cpu_stolen" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "System - High cpu.stolen usage"
  query            = "avg(${var.cpu_stolen_evaluation_period}):avg:system.cpu.stolen{${local.cpu_stolen_filter}} by {${var.alert_by}} > ${var.cpu_stolen_critical}"
  alert_message    = "| ${var.service} | {{${var.alert_by}.name}} | cpu.stolen: {{value}} | High cpu.stolen usage"
  recovery_message = "| ${var.service} | {{${var.alert_by}.name}} | cpu.stolen: {{value}} | cpu.stolen usage back to normal"

  # monitor level vars
  enabled              = var.cpu_stolen_enabled
  alerting_enabled     = var.cpu_stolen_alerting_enabled
  warning_threshold    = var.cpu_stolen_warning
  critical_threshold   = var.cpu_stolen_critical
  priority             = min(var.cpu_stolen_priority + var.priority_offset, 5)
  docs                 = var.cpu_stolen_docs
  note                 = var.cpu_stolen_note
  notification_channel = try(coalesce(var.cpu_stolen_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
