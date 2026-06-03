#!/bin/bash

# Member 5 - Clinical Analyst
process_vitals() {
    echo "Scanning for CRITICAL alerts..."

    grep "CRITICAL" active_logs/heart_rate.log active_logs/temperature.log | \
    awk -F',' '{print $1, $2, $3}' > reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"
    cat reports/critical_alerts.txt
}

# Call the function
process_vitals

# Check if log files exist before scanning
check_logs() {
    if [ ! -f "active_logs/heart_rate.log" ] || [ ! -f "active_logs/temperature.log" ]; then
        echo "Log files not found. Please run the hospital engine first."
        exit 1
    fi
}
