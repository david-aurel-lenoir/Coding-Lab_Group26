#!/bin/bash

# Member 5 - Clinical Analyst
# Function: process_vitals()

process_vitals() {
    echo "====================================="
    echo "  Running Clinical Vitals Analysis   "
    echo "====================================="

    HEART_RATE_LOG="active_logs/heart_rate.log"
    TEMP_LOG="active_logs/temperature.log"
    OUTPUT_FILE="reports/critical_alerts.txt"

    mkdir -p reports

    > "$OUTPUT_FILE"

    echo "Scanning logs for CRITICAL events..."

    echo "=== CRITICAL ALERTS REPORT ===" >> "$OUTPUT_FILE"
    echo "Generated: $(date)" >> "$OUTPUT_FILE"
    echo "-------------------------------" >> "$OUTPUT_FILE"

    echo ">> Heart Rate Critical Events:" >> "$OUTPUT_FILE"
    grep "CRITICAL" "$HEART_RATE_LOG" 2>/dev/null | awk -F',' '{print "Timestamp: " $1 " | Device_ID: " $2 " | Value: " $3}' >> "$OUTPUT_FILE"

    echo "" >> "$OUTPUT_FILE"
    echo ">> Temperature Critical Events:" >> "$OUTPUT_FILE"
    grep "CRITICAL" "$TEMP_LOG" 2>/dev/null | awk -F',' '{print "Timestamp: " $1 " | Device_ID: " $2 " | Value: " $3}' >> "$OUTPUT_FILE"

    echo "-------------------------------" >> "$OUTPUT_FILE"
    echo "End of Report" >> "$OUTPUT_FILE"

    echo "Critical alerts saved to: $OUTPUT_FILE"
}

process_vitals
