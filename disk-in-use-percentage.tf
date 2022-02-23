locals {
  disk_in_use_percentage_filter = coalesce(
    var.disk_in_use_percentage_filter_override,
    var.filter_str
  )
}

module "disk_in_use_percentage" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Disk In Use Percentage"
  query = "avg(${var.disk_in_use_percentage_evaluation_period}):min:system.disk.in_use{${local.disk_in_use_percentage_filter}} by {${var.alert_by}} * 100 > ${var.disk_in_use_percentage_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Disk usage on CloudAMQP Node {{${var.alert_by}.name}} has dropped below {{threshold}} ({{value}}%) available"
  recovery_message    = "Disk usage on CloudAMQP Node {{${var.alert_by}.name}} has recovered ({{value}}%) available"

  # monitor level vars
  enabled              = var.disk_in_use_percentage_enabled
  alerting_enabled     = var.disk_in_use_percentage_alerting_enabled
  warning_threshold    = var.disk_in_use_percentage_warning
  critical_threshold   = var.disk_in_use_percentage_critical
  priority             = min(var.disk_in_use_percentage_priority + var.priority_offset, 5)
  docs                 = var.disk_in_use_percentage_docs
  note                 = var.disk_in_use_percentage_note
  notification_channel = try(coalesce(var.disk_in_use_percentage_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
