update_car_rate() {
    car_id=$(dialog --inputbox "Enter Car ID:" 8 40 3>&1 1>&2 2>&3)

    new_rate=$(dialog --inputbox "Enter New Rate:" 8 40 3>&1 1>&2 2>&3)

    temp=$(mktemp)

    awk -F"," -v id="$car_id" -v rate="$new_rate" -v OFS="," '
    $1==id {
        $5=rate
    }
    1
    ' data/cars.txt > "$temp"

    mv "$temp" data/cars.txt

    log_action "Car Updated ID=$car_id NewRate=$new_rate"

    dialog --msgbox "Rate Updated Successfully!" 6 40
}
update_customer_phone() {
    customer_id=$(dialog --inputbox "Enter Customer ID:" 8 40 3>&1 1>&2 2>&3)

    new_phone=$(dialog --inputbox "Enter New Phone Number:" 8 40 3>&1 1>&2 2>&3)

    temp=$(mktemp)

    awk -F"," -v id="$customer_id" -v phone="$new_phone" -v OFS="," '
    $1==id {
        $3=phone
    }
    1
    ' data/customers.txt > "$temp"

    mv "$temp" data/customers.txt

    log_action "Customer Updated ID=$customer_id"

    dialog --msgbox "Phone Updated Successfully!" 6 40
}
update_menu() {
    choice=$(dialog --menu "Update Menu" 12 40 3 \
    1 "Update Car Rate" \
    2 "Update Customer Phone" \
    3 "Back" \
    2>&1 >/dev/tty)

    case $choice in
        1) update_car_rate ;;
        2) update_customer_phone ;;
        3) ;;
    esac
}
