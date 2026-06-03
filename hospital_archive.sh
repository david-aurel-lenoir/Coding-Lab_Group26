#!/bin/bash

# =============================================================
# hospital_archive.sh
# Member 4 - The Archivist
# =============================================================

archive_logs() {

    TIMESTAMP=$(date +"%Y%m%d_%H%M")

    echo "---------------------------------------------"
    echo " KNH Log Archiving Started - Member 4"
    echo " Timestamp: $TIMESTAMP"
    echo "---------------------------------------------"

    LOG_FILES=("heart_rate.log" "temperature.log" "water_usage.log")

    for FILE in "${LOG_FILES[@]}"; do

        SOURCE="active_logs/$FILE"
        FILENAME_NO_EXT="${FILE%.log}"
        DESTINATION="archived_logs/${FILENAME_NO_EXT}_${TIMESTAMP}.log"

        if [ -f "$SOURCE" ]; then
            mv "$SOURCE" "$DESTINATION"
            echo "[ARCHIVED]  $FILE  →  $DESTINATION"
        else
            echo "[SKIPPED]   $SOURCE not found."
        fi

        touch "$SOURCE"
        echo "[RECREATED] Empty $SOURCE ready for new data."

    done

    echo "---------------------------------------------"
    echo " Archiving Complete. System is live and ready."
    echo "---------------------------------------------"
}

archive_logs