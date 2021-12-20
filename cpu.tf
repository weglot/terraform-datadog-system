locals {
  cpu_filter = coalesce(
    var.cpu_filter_override,
    var.filter_str
  )
}

module "cpu" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - High CPU"
  query            = "avg(${var.cpu_evaluation_period}):avg:system.cpu.user{${local.cpu_filter}} by {host} + avg:system.cpu.system{${local.cpu_filter}} by {host} > ${var.cpu_critical}"
  alert_message    = "High CPU usage on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "CPU usage on Vault ${var.service} {{host.name}} Recovered ({{value}} %)"

  # monitor level vars
  enabled            = var.cpu_enabled
  alerting_enabled   = var.cpu_alerting_enabled
  warning_threshold  = var.cpu_warning
  critical_threshold = var.cpu_critical
  priority           = var.cpu_priority
  docs               = var.cpu_docs
  note               = var.cpu_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
