schedule_backup() {
    cron_job="0 0 * * * $(pwd)/backup.sh"

    (crontab -l 2>/dev/null
    echo "$cron_job") | crontab -

    log_action "Daily Backup Scheduled"

    dialog --msgbox "Daily Backup Scheduled!" 6 40
}
remove_schedule() {
    crontab -l | grep -v "backup.sh" | crontab -

    log_action "Backup Schedule Removed"

    dialog --msgbox "Backup Schedule Removed!" 6 40
}
cron_menu() {
    choice=$(dialog --menu "Cron Jobs" 12 40 3 \
    1 "Schedule Daily Backup" \
    2 "Remove Schedule" \
    3 "Back" \
    2>&1 >/dev/tty)

    case $choice in
        1) schedule_backup ;;
        2) remove_schedule ;;
        3) ;;
    esac
}
