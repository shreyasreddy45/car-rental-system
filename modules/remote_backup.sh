remote_backup() {
    server=$(dialog --inputbox "Enter SSH Host Alias:" 8 40 "aws" 3>&1 1>&2 2>&3)

    latest=$(ls -t backups/*.tar.gz 2>/dev/null | head -n 1)

    if [ -z "$latest" ]; then
        dialog --msgbox "No backup found!" 6 30
        return
    fi

    rsync -av "$latest" "$server:~/car_backups/"

    if [ $? -eq 0 ]; then
        log_action "Remote Backup Sent: $latest"
        dialog --msgbox "Backup uploaded successfully!" 6 40
    else
        dialog --msgbox "Upload failed!" 6 30
    fi
}
