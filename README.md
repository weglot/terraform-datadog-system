
[//]: # (This file is generated. Do not edit)

# system

TOC:
<!--ts-->
   * [system](#system)
      * [Datadog Agent](#datadog-agent)
      * [Required Services](#required-services)
      * [Bytes Sent](#bytes-sent)
      * [Uptime](#uptime)
      * [Packets Out Errors](#packets-out-errors)
      * [Memory Free Percent](#memory-free-percent)
      * [Datadog Agent Data](#datadog-agent-data)
      * [Packets In Errors](#packets-in-errors)
      * [Swap](#swap)
      * [Disk Free](#disk-free)
      * [Memory Free Bytes](#memory-free-bytes)
      * [Bytes Received](#bytes-received)
      * [Disk Iowait](#disk-iowait)
      * [CPU](#cpu)
      * [Module Variables](#module-variables)

<!-- Added by: sjuuljanssen, at: za 13 mrt 2021 15:51:20 CET -->

<!--te-->

## Datadog Agent

| variable                       | default                                  | required | description  |
|--------------------------------|------------------------------------------|----------|--------------|
| dd_agent_enabled               | True                                     | No       |              |
| dd_agent_evaluation_period     | last_15m                                 | No       |              |
| dd_agent_severity              | major                                    | No       |              |
| dd_agent_note                  | ""                                       | No       |              |
| dd_agent_docs                  | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |              |
| dd_agent_filter_override       | ""                                       | No       |              |
| dd_agent_data_alerting_enabled | True                                     | No       |              |


## Required Services

| variable                                     | default  | required | description  |
|----------------------------------------------|----------|----------|--------------|
| required_services_config                     | {}       | No       |              |
| required_services_default_freshness_duration | 5m       | No       |              |
| required_services_default_severity           | major    | No       |              |
| required_services_default_note               | ""       | No       |              |
| required_services_default_docs               | ""       | No       |              |
| required_services_filter_override            | ""       | No       |              |
| required_services_alerting_enabled           | True     | No       |              |


## Bytes Sent

| variable                     | default  | required | description  |
|------------------------------|----------|----------|--------------|
| bytes_sent_enabled           | True     | No       |              |
| bytes_sent_warning           | 4000000  | No       |              |
| bytes_sent_critical          | 5000000  | No       |              |
| bytes_sent_evaluation_period | last_30m | No       |              |
| bytes_sent_severity          | minor    | No       |              |
| bytes_sent_note              | ""       | No       |              |
| bytes_sent_docs              | ""       | No       |              |
| bytes_sent_filter_override   | ""       | No       |              |
| bytes_sent_alerting_enabled  | True     | No       |              |


## Uptime

| variable                | default  | required | description  |
|-------------------------|----------|----------|--------------|
| reboot_enabled          | True     | No       |              |
| reboot_severity         | critical | No       |              |
| reboot_note             | ""       | No       |              |
| reboot_docs             | ""       | No       |              |
| reboot_filter_override  | ""       | No       |              |
| reboot_alerting_enabled | True     | No       |              |


## Packets Out Errors

| variable                             | default                                  | required | description  |
|--------------------------------------|------------------------------------------|----------|--------------|
| packets_out_errors_enabled           | True                                     | No       |              |
| packets_out_errors_warning           | 0.5                                      | No       |              |
| packets_out_errors_critical          | 1                                        | No       |              |
| packets_out_errors_evaluation_period | last_15m                                 | No       |              |
| packets_out_errors_severity          | minor                                    | No       |              |
| packets_out_errors_note              | ""                                       | No       |              |
| packets_out_errors_docs              | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |              |
| packets_out_errors_filter_override   | ""                                       | No       |              |
| packets_out_errors_alerting_enabled  | True                                     | No       |              |


## Memory Free Percent

| variable                              | default  | required | description  |
|---------------------------------------|----------|----------|--------------|
| memory_free_percent_enabled           | True     | No       |              |
| memory_free_percent_warning           | 20       | No       |              |
| memory_free_percent_critical          | 10       | No       |              |
| memory_free_percent_evaluation_period | last_5m  | No       |              |
| memory_free_percent_severity          | critical | No       |              |
| memory_free_percent_note              | ""       | No       |              |
| memory_free_percent_docs              | ""       | No       |              |
| memory_free_percent_filter_override   | ""       | No       |              |
| memory_free_percent_alerting_enabled  | True     | No       |              |


## Datadog Agent Data

| variable                        | default                                  | required | description  |
|---------------------------------|------------------------------------------|----------|--------------|
| dd_agent_data_enabled           | True                                     | No       |              |
| dd_agent_data_freshness_minutes | 15                                       | No       |              |
| dd_agent_data_severity          | major                                    | No       |              |
| dd_agent_data_note              | ""                                       | No       |              |
| dd_agent_data_docs              | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |              |
| dd_agent_data_filter_override   | ""                                       | No       |              |
| dd_agent_alerting_enabled       | True                                     | No       |              |


## Packets In Errors

| variable                            | default                                  | required | description  |
|-------------------------------------|------------------------------------------|----------|--------------|
| packets_in_errors_enabled           | True                                     | No       |              |
| packets_in_errors_warning           | 0.5                                      | No       |              |
| packets_in_errors_critical          | 1                                        | No       |              |
| packets_in_errors_evaluation_period | last_15m                                 | No       |              |
| packets_in_errors_severity          | minor                                    | No       |              |
| packets_in_errors_note              | ""                                       | No       |              |
| packets_in_errors_docs              | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |              |
| packets_in_errors_filter_override   | ""                                       | No       |              |
| packets_in_errors_alerting_enabled  | True                                     | No       |              |


## Swap

| variable                            | default  | required | description  |
|-------------------------------------|----------|----------|--------------|
| swap_percent_free_enabled           | True     | No       |              |
| swap_percent_free_warning           | 20       | No       |              |
| swap_percent_free_critical          | 10       | No       |              |
| swap_percent_free_evaluation_period | last_5m  | No       |              |
| swap_percent_free_severity          | minor    | No       |              |
| swap_percent_free_note              | ""       | No       |              |
| swap_percent_free_docs              | ""       | No       |              |
| swap_percent_free_filter_override   | ""       | No       |              |
| swap_percent_free_alerting_enabled  | True     | No       |              |


## Disk Free

| variable                    | default  | required | description  |
|-----------------------------|----------|----------|--------------|
| disk_free_enabled           | True     | No       |              |
| disk_free_warning           | 25       | No       |              |
| disk_free_critical          | 10       | No       |              |
| disk_free_evaluation_period | last_5m  | No       |              |
| disk_free_severity          | critical | No       |              |
| disk_free_note              | ""       | No       |              |
| disk_free_docs              | ""       | No       |              |
| disk_free_filter_override   | ""       | No       |              |
| disk_free_alerting_enabled  | True     | No       |              |


## Memory Free Bytes

| variable                            | default    | required | description                                                                          |
|-------------------------------------|------------|----------|--------------------------------------------------------------------------------------|
| memory_free_bytes_enabled           | False      | No       | Memory free based on absolute values. Disabled by default to use memory_free_percent |
| memory_free_bytes_warning           | 2000000000 | No       |                                                                                      |
| memory_free_bytes_critical          | 1000000000 | No       |                                                                                      |
| memory_free_bytes_evaluation_period | last_5m    | No       |                                                                                      |
| memory_free_bytes_severity          | critical   | No       |                                                                                      |
| memory_free_bytes_note              | ""         | No       |                                                                                      |
| memory_free_bytes_docs              | ""         | No       |                                                                                      |
| memory_free_bytes_filter_override   | ""         | No       |                                                                                      |
| memory_free_alerting_enabled        | True       | No       |                                                                                      |


## Bytes Received

| variable                         | default  | required | description  |
|----------------------------------|----------|----------|--------------|
| bytes_received_enabled           | True     | No       |              |
| bytes_received_warning           | 4000000  | No       |              |
| bytes_received_critical          | 5000000  | No       |              |
| bytes_received_evaluation_period | last_30m | No       |              |
| bytes_received_severity          | minor    | No       |              |
| bytes_received_note              | ""       | No       |              |
| bytes_received_docs              | ""       | No       |              |
| bytes_received_filter_override   | ""       | No       |              |
| bytes_received_alerting_enabled  | True     | No       |              |


## Disk Iowait

| variable                       | default                                  | required | description  |
|--------------------------------|------------------------------------------|----------|--------------|
| disk_io_wait_enabled           | True                                     | No       |              |
| disk_io_wait_warning           | 80                                       | No       |              |
| disk_io_wait_critical          | 95                                       | No       |              |
| disk_io_wait_evaluation_period | last_30m                                 | No       |              |
| disk_io_wait_severity          | critical                                 | No       |              |
| disk_io_wait_note              | ""                                       | No       |              |
| disk_io_wait_docs              | The CPU is mainly waiting for data to be written on disk. This means in general that application running on this machine is stalled | No       |              |
| disk_io_wait_filter_override   | ""                                       | No       |              |
| disk_io_wait_alerting_enabled  | True                                     | No       |              |


## CPU

| variable              | default  | required | description  |
|-----------------------|----------|----------|--------------|
| cpu_enabled           | True     | No       |              |
| cpu_warning           | 80       | No       |              |
| cpu_critical          | 95       | No       |              |
| cpu_evaluation_period | last_30m | No       |              |
| cpu_severity          | major    | No       |              |
| cpu_note              | ""       | No       |              |
| cpu_docs              | ""       | No       |              |
| cpu_filter_override   | ""       | No       |              |
| cpu_alerting_enabled  | True     | No       |              |


## Module Variables

| variable             | default  | required | description  |
|----------------------|----------|----------|--------------|
| env                  |          | Yes      |              |
| alert_env            |          | Yes      |              |
| filter_str           |          | Yes      |              |
| service              |          | Yes      |              |
| notification_channel |          | Yes      |              |
| additional_tags      | []       | No       |              |


