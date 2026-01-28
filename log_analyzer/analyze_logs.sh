#!/bin/bash
LOG_FILE="/var/log/syslog"
OUTPUT_LOG="./logs/analysis.log"
ERROR_LIMIT=5

mkdir -p logs

echo "log analysis started on: $(date)" | tee -a "$OUTPUT_LOG"
echo "1. Error count"
echo "2. Warning count"
echo "3. Failed login attempts"
echo "4. full summary"
echo "5. exit"

read -p "enter your choice: " choice

case $choice in
1) error=$(grep -a -i "error" "$LOG_FILE" | wc -l)
echo "total Error: $error" | tee -a "$OUTPUT_LOG"
if [ "$error" -ge "$ERROR_LIMIT" ] ;
then
echo "alert:high number of errors detected" | tee -a "$OUTPUT_LOG"
fi
;;

2)
warnings=$(grep -a -i "warning" "$LOG_FILE" | wc -l)
echo "total Warnings: $warnings" | tee -a "$OUTPUT_LOG"
;;

3)
failed=$(grep -a -i "failed" "$LOG_FILE" | wc -l)
echo "Failed login attempts: $failed" | tee -a "$OUTPUT_LOG"
;;

4)
echo "Errors: $(grep -a -i "error" "$LOG_FILE" | wc -l)" | tee -a "$OUTPUT_LOG"
echo "Warnings: $(grep -a -i "warning" "$LOG_FILE" | wc -l)" | tee -a "$OUTPUT_LOG"
echo "Failed: $(grep -a -i "failed" "$LOG_FILE" | wc -l)" | tee -a "$OUTPUT_LOG"
;;
5)
echo "exiting log analyzer" | tee -a "$OUTPUT_LOG"
exit 0
;;
*)
echo "invalid option" | tee -a "$OUTPUT_LOG"
;;
esac

