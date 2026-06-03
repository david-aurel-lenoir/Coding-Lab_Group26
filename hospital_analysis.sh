#!/bin/bash

process_vitals() {
    echo "Processing critical vitals"

    grep "CRITICAL" active_logs/heart_rate.log | awk -F',' '{print "Heart Rate | Timestamp:" $1 " | Device:" $2 " | Value:" $3}' >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature.log | awk -F',' '{print "Temperature | Timestamp:" $1 " | Device:" $2 " | Value:" $3}' >> reports/critical_alerts.txt

    echo "Critical alerts saved in reports/critical_alerts.txt"
}

process_vitals
