#!/bin/bash

# Script: hospital_analysis.sh
# Member 5: Clinical Analyst
# Function: process_vitals()
# Purpose: This function scans through
#          the heart rate and temperature
#          log files inside active_logs/
#          It searches for any row marked
#          as CRITICAL using grep.
#          It then extracts the Timestamp,
#          Device_ID and Value using awk
#          and saves them into
#          reports/critical_alerts.txt

process_vitals() {
    echo "Processing critical vitals"

    grep "CRITICAL" active_logs/heart_rate.log | awk -F',' '{print "Heart Rate | Timestamp:" $1 " | Device:" $2 " | Value:" $3}' >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature.log | awk -F',' '{print "Temperature | Timestamp:" $1 " | Device:" $2 " | Value:" $3}' >> reports/critical_alerts.txt

    echo "Critical alerts saved in reports/critical_alerts.txt"
}

process_vitals
