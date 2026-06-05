Hospital Management Bash Scripts

A collaborative shell-scripting project that automates setup, analysis, and archiving
of a hospitals log data. The work is divided across three scripts, with each team
member responsible for a specific function.

Script 1: hospital_admin.sh

Prepares and secures the working environment before any data is processed.

 Member 1
  Checks whether the active_logs, archived_logs, and reports directories exist. If any are missing, it creates them, using echo to print status updates to the user.

 Member 2
  Uses chmod to restrict the active_logs directory so that only the owner has read and write permissions. Runs ls -l afterward to display the updated permissions back to the user for confirmation.

 Member 3
  Drives the script by calling initialize_system and secure_data in order, then prints a "System Environment Secured" confirmation message along with the current date.


Script 2: hospital_analysis.sh

Analyzes live data in the active_logs folder before it is archived.

 Member 5
  Uses grep to find every CRITICAL row in both the Heart Rate and Temperature logs. Uses awk to extract the Timestamp, Device_ID, and Value fields, then saves the results to reports/critical_alerts.txt.

 Member 6
  Analyzes resource usage by calculating the average water usage for the ICU_WATER_RESERVE with awk, and prints a clean, formatted summary to the screen using printf.


Script 3: hospital_archive.sh

Moves data out of the active workspace once analysis is complete.

Member 4
  Moves the current logs from active_logs to archived_logs and renames each file with a timestamp, keeping the active folder clean for the next cycle.
