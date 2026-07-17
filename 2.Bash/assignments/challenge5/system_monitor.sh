#!/bin/bash

# ----------------------------------------------
# Bonus Challenge - System Monitor Script
# ----------------------------------------------

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="system_monitor_$timestamp.log"

{
    echo "System Monitor Report"
    echo "Generated: $(date)"
    echo

    echo "CPU Usage:"
    top -l 1 | grep "CPU usage"

    echo
    echo "Memory Usage:"
    vm_stat | head -6

    echo
    echo "Disk Usage:"
    df -h /

    echo
    echo "Top 5 Processes by Memory:"
    ps aux | sort -nr -k 4 | head -5

} > "$log_file"

echo "Report saved to: $log_file"

cat "$log_file"