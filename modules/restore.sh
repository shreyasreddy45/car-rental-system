restore_backup() {
    backup=$(ls -t backups/*.tar.gz 2>/dev/null | head -n 1)

    if [ -z "$backup" ]; then
        dialog --msgbox "No backups found!" 6 30
        return
    fi

    tar -xzf "$backup"

    log_action "Backup Restored: $backup"

    dialog --msgbox "Backup Restored Successfully!" 7 40
}
