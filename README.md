
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog System

This module is responsible for System level alerts. CPU, network, memory, disk, etc...
Process performance monitoring (cpu, memory) is not covered in this module.
It is possible though to check if specific processes are running.

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
module "system" {
  source = "kabisa/system/datadog"

  notification_channel       = "mail@example.com"
  service                    = "ServiceX"
  env                        = "prd"
  filter_str                 = "host:myserver"
  service_check_include_tags = ["host:myserver"]
}
```

Monitors:
* [Terraform module for Datadog System](#terraform-module-for-datadog-system)
  * [Datadog Agent](#datadog-agent)
  * [Required Services](#required-services)
  * [Bytes Sent](#bytes-sent)
  * [Disk Free Percent](#disk-free-percent)
  * [Packets Out Errors](#packets-out-errors)
  * [Memory Free Percent](#memory-free-percent)
  * [Datadog Agent Data](#datadog-agent-data)
  * [Disk Free Bytes](#disk-free-bytes)
  * [Packets In Errors](#packets-in-errors)
  * [Swap](#swap)
  * [Memory Free Bytes](#memory-free-bytes)
  * [Bytes Received](#bytes-received)
  * [Disk Iowait](#disk-iowait)
  * [Reboot](#reboot)
  * [CPU](#cpu)
  * [Module Variables](#module-variables)

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Datadog Agent

Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event

Query:
```terraform
avg(${var.dd_agent_evaluation_period}):avg:datadog.agent.running{${local.dd_agent_filter}} by {host} < 1
```

| variable                               | default                                  | required | description                      |
|----------------------------------------|------------------------------------------|----------|----------------------------------|
| dd_agent_enabled                       | True                                     | No       |                                  |
| dd_agent_evaluation_period             | last_15m                                 | No       |                                  |
| dd_agent_note                          | ""                                       | No       |                                  |
| dd_agent_docs                          | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |                                  |
| dd_agent_filter_override               | ""                                       | No       |                                  |
| dd_agent_alerting_enabled              | True                                     | No       |                                  |
| dd_agent_priority                      | 2                                        | No       | Number from 1 (high) to 5 (low). |
| dd_agent_notification_channel_override | ""                                       | No       |                                  |


## Required Services

Query:
```terraform
processes('${each.key}').over('tag:xxx').by('host').rollup('count').last('${lookup(each.value, "freshness_duration", var.required_services_default_freshness_duration)}') < ${lookup(each.value, "process_count", 1)}
```

| variable                                        | default  | required | description                      |
|-------------------------------------------------|----------|----------|----------------------------------|
| required_services_enabled                       | True     | No       |                                  |
| required_services_config                        | {}       | No       |                                  |
| required_services_default_freshness_duration    | 5m       | No       |                                  |
| required_services_default_note                  | ""       | No       |                                  |
| required_services_default_docs                  | ""       | No       |                                  |
| required_services_filter_override               | ""       | No       |                                  |
| required_services_alerting_enabled              | True     | No       |                                  |
| required_services_default_priority              | 2        | No       | Number from 1 (high) to 5 (low). |
| required_services_notification_channel_override | ""       | No       |                                  |


## Bytes Sent

Query:
```terraform
avg(last_30m):avg:system.net.bytes_sent{tag:xxx} by {host} > 5000000
```

| variable                                 | default  | required | description                      |
|------------------------------------------|----------|----------|----------------------------------|
| bytes_sent_enabled                       | True     | No       |                                  |
| bytes_sent_warning                       | 4000000  | No       |                                  |
| bytes_sent_critical                      | 5000000  | No       |                                  |
| bytes_sent_evaluation_period             | last_30m | No       |                                  |
| bytes_sent_note                          | ""       | No       |                                  |
| bytes_sent_docs                          | ""       | No       |                                  |
| bytes_sent_filter_override               | ""       | No       |                                  |
| bytes_sent_alerting_enabled              | True     | No       |                                  |
| bytes_sent_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| bytes_sent_notification_channel_override | ""       | No       |                                  |


## Disk Free Percent

Query:
```terraform
avg(last_5m):100 * min:system.disk.free{tag:xxx} by {host,device} / min:system.disk.total{tag:xxx} by {host,device} < 10
```

| variable                                        | default  | required | description                      |
|-------------------------------------------------|----------|----------|----------------------------------|
| disk_free_percent_enabled                       | True     | No       |                                  |
| disk_free_percent_warning                       | 20       | No       |                                  |
| disk_free_percent_critical                      | 10       | No       |                                  |
| disk_free_percent_evaluation_period             | last_5m  | No       |                                  |
| disk_free_percent_note                          | ""       | No       |                                  |
| disk_free_percent_docs                          | ""       | No       |                                  |
| disk_free_percent_filter_override               | ""       | No       |                                  |
| disk_free_percent_alerting_enabled              | True     | No       |                                  |
| disk_free_percent_priority                      | 1        | No       | Number from 1 (high) to 5 (low). |
| disk_free_percent_notification_channel_override | ""       | No       |                                  |


## Packets Out Errors

Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/

Query:
```terraform
avg(last_15m):100 * max:system.net.packets_out.error{tag:xxx} by {host} / ( max:system.net.packets_out.count{tag:xxx} by {host} + 1000 ) > 1
```

| variable                                         | default                                  | required | description                      |
|--------------------------------------------------|------------------------------------------|----------|----------------------------------|
| packets_out_errors_enabled                       | True                                     | No       |                                  |
| packets_out_errors_warning                       | 0.5                                      | No       |                                  |
| packets_out_errors_critical                      | 1                                        | No       |                                  |
| packets_out_errors_evaluation_period             | last_15m                                 | No       |                                  |
| packets_out_errors_note                          | ""                                       | No       |                                  |
| packets_out_errors_docs                          | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |                                  |
| packets_out_errors_filter_override               | ""                                       | No       |                                  |
| packets_out_errors_alerting_enabled              | True                                     | No       |                                  |
| packets_out_errors_priority                      | 3                                        | No       | Number from 1 (high) to 5 (low). |
| packets_out_errors_notification_channel_override | ""                                       | No       |                                  |


## Memory Free Percent

Query:
```terraform
avg(last_5m):min:system.mem.pct_usable{tag:xxx} by {host} < 10
```

| variable                                          | default  | required | description                      |
|---------------------------------------------------|----------|----------|----------------------------------|
| memory_free_percent_enabled                       | True     | No       |                                  |
| memory_free_percent_warning                       | 20       | No       |                                  |
| memory_free_percent_critical                      | 10       | No       |                                  |
| memory_free_percent_evaluation_period             | last_5m  | No       |                                  |
| memory_free_percent_note                          | ""       | No       |                                  |
| memory_free_percent_docs                          | ""       | No       |                                  |
| memory_free_percent_filter_override               | ""       | No       |                                  |
| memory_free_percent_alerting_enabled              | True     | No       |                                  |
| memory_free_percent_priority                      | 2        | No       | Number from 1 (high) to 5 (low). |
| memory_free_percent_notification_channel_override | ""       | No       |                                  |


## Datadog Agent Data

Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event

| variable                                    | default                                  | required | description                      |
|---------------------------------------------|------------------------------------------|----------|----------------------------------|
| dd_agent_data_enabled                       | True                                     | No       |                                  |
| dd_agent_data_note                          | ""                                       | No       |                                  |
| dd_agent_data_docs                          | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |                                  |
| dd_agent_data_filter_override               | ""                                       | No       |                                  |
| dd_agent_data_include_tags_override         | None                                     | No       |                                  |
| dd_agent_data_exclude_tags_override         | None                                     | No       |                                  |
| dd_agent_data_alerting_enabled              | True                                     | No       |                                  |
| dd_agent_data_priority                      | 2                                        | No       | Number from 1 (high) to 5 (low). |
| dd_agent_data_notification_channel_override | ""                                       | No       |                                  |


## Disk Free Bytes

Query:
```terraform
avg(last_5m):min:system.disk.free{tag:xxx} by {host,device} < 10000000000
```

| variable                                      | default     | required | description                      |
|-----------------------------------------------|-------------|----------|----------------------------------|
| disk_free_bytes_enabled                       | False       | No       |                                  |
| disk_free_bytes_warning                       | 20000000000 | No       |                                  |
| disk_free_bytes_critical                      | 10000000000 | No       |                                  |
| disk_free_bytes_evaluation_period             | last_5m     | No       |                                  |
| disk_free_bytes_note                          | ""          | No       |                                  |
| disk_free_bytes_docs                          | ""          | No       |                                  |
| disk_free_bytes_filter_override               | ""          | No       |                                  |
| disk_free_bytes_alerting_enabled              | True        | No       |                                  |
| disk_free_bytes_priority                      | 1           | No       | Number from 1 (high) to 5 (low). |
| disk_free_bytes_notification_channel_override | ""          | No       |                                  |


## Packets In Errors

Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/

Query:
```terraform
avg(last_15m):100 * max:system.net.packets_in.error{tag:xxx} by {host} / ( max:system.net.packets_in.count{tag:xxx} by {host} + 1000 ) > 1
```

| variable                                        | default                                  | required | description                      |
|-------------------------------------------------|------------------------------------------|----------|----------------------------------|
| packets_in_errors_enabled                       | True                                     | No       |                                  |
| packets_in_errors_warning                       | 0.5                                      | No       |                                  |
| packets_in_errors_critical                      | 1                                        | No       |                                  |
| packets_in_errors_evaluation_period             | last_15m                                 | No       |                                  |
| packets_in_errors_note                          | ""                                       | No       |                                  |
| packets_in_errors_docs                          | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |                                  |
| packets_in_errors_filter_override               | ""                                       | No       |                                  |
| packets_in_errors_alerting_enabled              | True                                     | No       |                                  |
| packets_in_errors_priority                      | 3                                        | No       | Number from 1 (high) to 5 (low). |
| packets_in_errors_notification_channel_override | ""                                       | No       |                                  |


## Swap

Query:
```terraform
avg(${var.swap_percent_free_evaluation_period}):min:system.swap.pct_free{${local.swap_percent_free_filter}} by {host} * 100 < ${var.swap_percent_free_critical}
```

| variable                                        | default  | required | description                      |
|-------------------------------------------------|----------|----------|----------------------------------|
| swap_percent_free_enabled                       | True     | No       |                                  |
| swap_percent_free_warning                       | 15       | No       |                                  |
| swap_percent_free_critical                      | 10       | No       |                                  |
| swap_percent_free_evaluation_period             | last_5m  | No       |                                  |
| swap_percent_free_note                          | ""       | No       |                                  |
| swap_percent_free_docs                          | ""       | No       |                                  |
| swap_percent_free_filter_override               | ""       | No       |                                  |
| swap_percent_free_alerting_enabled              | True     | No       |                                  |
| swap_percent_free_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| swap_percent_free_notification_channel_override | ""       | No       |                                  |


## Memory Free Bytes

Query:
```terraform
avg(last_5m):min:system.mem.usable{tag:xxx} by {host} < 1000000000
```

| variable                                        | default    | required | description                                                                          |
|-------------------------------------------------|------------|----------|--------------------------------------------------------------------------------------|
| memory_free_bytes_enabled                       | False      | No       | Memory free based on absolute values. Disabled by default to use memory_free_percent |
| memory_free_bytes_warning                       | 2000000000 | No       |                                                                                      |
| memory_free_bytes_critical                      | 1000000000 | No       |                                                                                      |
| memory_free_bytes_evaluation_period             | last_5m    | No       |                                                                                      |
| memory_free_bytes_note                          | ""         | No       |                                                                                      |
| memory_free_bytes_docs                          | ""         | No       |                                                                                      |
| memory_free_bytes_filter_override               | ""         | No       |                                                                                      |
| memory_free_bytes_alerting_enabled              | True       | No       |                                                                                      |
| memory_free_bytes_priority                      | 2          | No       | Number from 1 (high) to 5 (low).                                                     |
| memory_free_bytes_notification_channel_override | ""         | No       |                                                                                      |


## Bytes Received

Query:
```terraform
avg(last_30m):avg:system.net.bytes_rcvd{tag:xxx} by {host} > 5000000
```

| variable                                     | default  | required | description                      |
|----------------------------------------------|----------|----------|----------------------------------|
| bytes_received_enabled                       | True     | No       |                                  |
| bytes_received_warning                       | 4000000  | No       |                                  |
| bytes_received_critical                      | 5000000  | No       |                                  |
| bytes_received_evaluation_period             | last_30m | No       |                                  |
| bytes_received_note                          | ""       | No       |                                  |
| bytes_received_docs                          | ""       | No       |                                  |
| bytes_received_filter_override               | ""       | No       |                                  |
| bytes_received_alerting_enabled              | True     | No       |                                  |
| bytes_received_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| bytes_received_notification_channel_override | ""       | No       |                                  |


## Disk Iowait

The CPU is mainly waiting for data to be written on disk. This means in general that application running on this machine is stalled

Query:
```terraform
avg(${var.disk_io_wait_evaluation_period}):avg:system.cpu.iowait{${local.disk_io_wait_filter}} by {host} > ${var.disk_io_wait_critical}
```

| variable                                   | default                                  | required | description                      |
|--------------------------------------------|------------------------------------------|----------|----------------------------------|
| disk_io_wait_enabled                       | True                                     | No       |                                  |
| disk_io_wait_warning                       | 80                                       | No       |                                  |
| disk_io_wait_critical                      | 95                                       | No       |                                  |
| disk_io_wait_evaluation_period             | last_30m                                 | No       |                                  |
| disk_io_wait_note                          | ""                                       | No       |                                  |
| disk_io_wait_docs                          | The CPU is mainly waiting for data to be written on disk. This means in general that application running on this machine is stalled | No       |                                  |
| disk_io_wait_filter_override               | ""                                       | No       |                                  |
| disk_io_wait_alerting_enabled              | True                                     | No       |                                  |
| disk_io_wait_priority                      | 2                                        | No       | Number from 1 (high) to 5 (low). |
| disk_io_wait_notification_channel_override | ""                                       | No       |                                  |


## Reboot

Query:
```terraform
min(last_5m):derivative(max:system.uptime{tag:xxx} by {host}) < 0
```

| variable                             | default  | required | description                      |
|--------------------------------------|----------|----------|----------------------------------|
| reboot_enabled                       | True     | No       |                                  |
| reboot_note                          | ""       | No       |                                  |
| reboot_docs                          | ""       | No       |                                  |
| reboot_filter_override               | ""       | No       |                                  |
| reboot_alerting_enabled              | True     | No       |                                  |
| reboot_priority                      | 3        | No       | Number from 1 (high) to 5 (low). |
| reboot_notification_channel_override | ""       | No       |                                  |


## CPU

Query:
```terraform
avg(last_30m):avg:system.cpu.user{tag:xxx} by {host} + avg:system.cpu.system{tag:xxx} by {host} > 95
```

| variable                          | default  | required | description                      |
|-----------------------------------|----------|----------|----------------------------------|
| cpu_enabled                       | True     | No       |                                  |
| cpu_warning                       | 80       | No       |                                  |
| cpu_critical                      | 95       | No       |                                  |
| cpu_evaluation_period             | last_30m | No       |                                  |
| cpu_note                          | ""       | No       |                                  |
| cpu_docs                          | ""       | No       |                                  |
| cpu_filter_override               | ""       | No       |                                  |
| cpu_alerting_enabled              | True     | No       |                                  |
| cpu_priority                      | 2        | No       | Number from 1 (high) to 5 (low). |
| cpu_notification_channel_override | ""       | No       |                                  |


## Module Variables

| variable                   | default  | required | description                                                                                          |
|----------------------------|----------|----------|------------------------------------------------------------------------------------------------------|
| env                        |          | Yes      |                                                                                                      |
| filter_str                 |          | Yes      |                                                                                                      |
| service                    |          | Yes      | Service name of what you're monitoring. This also sets the service:<service> tag on the monitor      |
| service_display_name       | None     | No       |                                                                                                      |
| notification_channel       |          | Yes      | Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false |
| additional_tags            | []       | No       | Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags |
| name_prefix                | ""       | No       | Can be used to prefix to the Monitor name                                                            |
| name_suffix                | ""       | No       | Can be used to suffix to the Monitor name                                                            |
| locked                     | True     | No       |                                                                                                      |
| service_check_include_tags | None     | No       | List of tags for the \"over\" part of the query. Can be either key:value tags or boolean tags.       |
| service_check_exclude_tags | None     | No       | List of tags for the \"exclude\" part of the query. Can be either key:value tags or boolean tags.    |
| priority_offset            | 0        | No       | For non production workloads we can +1 on the priorities                                             |


