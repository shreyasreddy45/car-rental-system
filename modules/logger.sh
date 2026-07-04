log_action() {

    echo "$(date '+%F %T') : $1" >> "$LOG_FILE"

}
