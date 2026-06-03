#!/bin/bash
# Author: Member 6 - Facility Auditor
# Date: 2026-06-03
# =============================================
# Member 6 - Facility Auditor
# Function: water_audit
# =============================================

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

# Call the function
water_audit
