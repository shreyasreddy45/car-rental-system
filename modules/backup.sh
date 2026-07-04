backup_data() {
    mkdir -p "$BACKUP_DIR"

    backup_file="$BACKUP_DIR/backup_$(date +%F_%H-%M-%S).tar.gz"

    tar -czf "$backup_file" data/

    log_action "Backup Created: $backup_file"

    dialog --msgbox "Backup Created Successfully!" 7 40
}
