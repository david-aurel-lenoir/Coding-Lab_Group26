#!/bin/bash

# Member 5 - Clinical Analyst
process_vitals() {
    echo "Scanning for CRITICAL alerts..."

    grep "CRITICAL" active_logs/heart_rate.log active_logs/temperature.log | \
    awk -F',' '{print $1, $2, $3}' > reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"
    cat reports/critical_alerts.txt
}

# Check if log files exist before scanning
check_logs() {
    if [ ! -f "active_logs/heart_rate.log" ] || [ ! -f "active_logs/temperature.log" ]; then
        echo "Log files not found. Please run the hospital engine first."
        exit 1
    fi
}

# Member 6 - Facility Auditor
water_audit() {
    LOG_FILE="active_logs/water_usage.log"

    if [ ! -f "$LOG_FILE" ]; then
        echo "ERROR: Water usage log not found at $LOG_FILE"
        return 1
    fi

    echo "Running water audit..."

    awk -F',' '
        $2 == "ICU_WATER_RESERVE" {
            total += $3
            count++
        }
        END {
            if (count == 0) {
                print "No ICU_WATER_RESERVE data found."
            } else {
                avg = total / count
                printf "=========================================\n"
                printf "     KNH WATER USAGE AUDIT REPORT\n"
                printf "=========================================\n"
                printf "  Device         : ICU_WATER_RESERVE\n"
                printf "  Total Readings : %d\n", count
                printf "  Average Usage  : %.2f Liters\n", avg
                printf "=========================================\n"
            }
        }
    ' "$LOG_FILE"
}

# Call the functions
process_vitals
water_audit