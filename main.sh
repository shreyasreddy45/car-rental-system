#!/bin/bash

mkdir -p data
mkdir -p backups
mkdir -p locks

touch data/cars.txt
touch data/customers.txt
touch data/rentals.txt
touch data/logs.txt


source config.conf
source modules/search.sh
source modules/car.sh
source modules/restore.sh
source modules/customer.sh
source modules/backup.sh
source modules/rental.sh
source modules/logger.sh
source modules/update.sh
source modules/delete.sh
source modules/cron.sh
source modules/remote_backup.sh

while true
do

choice=$(dialog --menu "Car Rental System" 24 50 17 \
1 "Add Car" \
2 "View Cars" \
3 "Add Customer" \
4 "View Customers" \
5 "Rent Car" \
6 "Return Car" \
7 "Rental Log" \
8 "Reports" \
9 "Backup Data" \
10 "Restore Backup" \
11 "Search" \
12 "Update" \
13 "Delete" \
14 "View Logs" \
15 "Remote Backup" \
16 "Cron Jobs" \
17 "Exit" \
2>&1 >/dev/tty)

case $choice in

1) add_car ;;

2) view_cars ;;

3) add_customer ;;

4) view_customers ;;

5) rent_car ;;

6) return_car ;;

7) rental_log ;;
8) report_menu ;;
9) backup_data ;;
10) restore_backup ;;
11) search_menu ;;
12) update_menu ;;
13) delete_menu ;;
14)
    logs=$(cat data/logs.txt)
    dialog --msgbox "$logs" 20 80
    ;;
15) remote_backup ;;
16) cron_menu ;;
17)
    clear
    break
    ;;
*) dialog --msgbox \
   "Invalid Choice!" \
   6 20 ;;

esac

done
