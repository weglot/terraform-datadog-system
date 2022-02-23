locals {
  cpu_filter = coalesce(
    var.cpu_filter_override,
    var.filter_str
  )
}

module "cpu" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - High CPU"
  query            = "avg(${var.cpu_evaluation_period}):avg:system.cpu.user{${local.cpu_filter}} by {${var.alert_by}} + avg:system.cpu.system{${local.cpu_filter}} by {${var.alert_by}} > ${var.cpu_critical}"
  alert_message    = "High CPU usage on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "CPU usage on Vault ${var.service} {{host.name}} Recovered ({{value}} %)"

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
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
