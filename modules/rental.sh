rent_car() {
    exec 200>locks/rental.lock

    if ! flock -n 200
    then
        dialog --msgbox "Another rental operation is running!" 6 40
        return
    fi

    customer_id=$(dialog --inputbox "Enter Customer ID:" 8 40 3>&1 1>&2 2>&3)

    car_id=$(dialog --inputbox "Enter Car ID:" 8 40 3>&1 1>&2 2>&3)

    rental_date=$(dialog --inputbox "Enter Rental Date (YYYY-MM-DD):" 8 40 3>&1 1>&2 2>&3)

    return_date=$(dialog --inputbox "Enter Return Date (YYYY-MM-DD):" 8 40 3>&1 1>&2 2>&3)

    if [ -z "$customer_id" ] || [ -z "$car_id" ] || \
       [ -z "$rental_date" ] || [ -z "$return_date" ]
    then
        flock -u 200
        dialog --msgbox "All fields are required!" 6 40
        return
    fi

    if ! date -d "$rental_date" &>/dev/null || \
       ! date -d "$return_date" &>/dev/null
    then
        flock -u 200
        dialog --msgbox "Invalid Date Format!" 6 40
        return
    fi

    rented=$(awk -F"," -v id="$car_id" \
    '$3==id && $8=="Ongoing" {print "Rented"}' \
    data/rentals.txt)

    if [ -n "$rented" ]
    then
        flock -u 200
        dialog --msgbox "Car already rented!" 6 30
        return
    fi

    days=$(( ($(date -d "$return_date" +%s) -
              $(date -d "$rental_date" +%s)) / 86400 ))

    rate=$(awk -F"," -v id="$car_id" \
    '$1==id {print $5}' data/cars.txt)

    total=$(( days * rate ))

    rental_id=$(( $(wc -l < data/rentals.txt) + 301 ))

    echo "$rental_id,$customer_id,$car_id,$rental_date,$return_date,$total,0,Ongoing" >> data/rentals.txt

    log_action "Rental Created : RentalID=$rental_id Customer=$customer_id Car=$car_id"

    dialog --msgbox "Rental Successful!\nRental ID: $rental_id\nTotal: ₹$total" 8 40

    flock -u 200
}

return_car() {

    car_id=$(dialog --inputbox \
    "Enter Car ID:" 8 40 3>&1 1>&2 2>&3)

    rental_info=$(awk -F"," -v id="$car_id" \
    '$3==id && $8=="Ongoing" {print; exit}' \
    data/rentals.txt)

    if [ -z "$rental_info" ]; then

        dialog --msgbox \
        "Car not currently rented!" 6 40

        return
    fi

    rental_id=$(echo "$rental_info" | cut -d"," -f1)

    expected_return=$(echo "$rental_info" | cut -d"," -f5)

    actual_return=$(dialog --inputbox \
    "Actual Return Date:" 8 40 \
    3>&1 1>&2 2>&3)

    overdue_days=$(( (
    $(date -d "$actual_return" +%s) -
    $(date -d "$expected_return" +%s)
    ) / 86400 ))

    if [ "$overdue_days" -gt 0 ]; then

        fine=$(( overdue_days * FINE_PER_DAY ))

    else

        fine=0

    fi

    temp=$(mktemp)

    awk -F"," -v id="$rental_id" \
    -v fine="$fine" \
    -v OFS="," '

    $1==id {
        $7=fine
        $8="Completed"
    }

    1

    ' data/rentals.txt > "$temp"

    mv "$temp" data/rentals.txt
    log_action "Car Returned : CarID=$car_id Fine=$fine"

    dialog --msgbox \
    "Car Returned.\nFine: ₹$fine" \
    7 30
}

rental_log() {

    rental_list=$(awk -F"," '{

    printf "RID:%s CID:%s Car:%s Amount:%s Status:%s\n",

    $1,$2,$3,$6,$8

    }' data/rentals.txt)

    dialog --title "Rental Log" \
    --msgbox "$rental_list" 20 80
}
