delete_car() {
    car_id=$(dialog --inputbox "Enter Car ID:" 8 40 3>&1 1>&2 2>&3)

    confirm=$(dialog --yesno "Delete Car ID $car_id?" 7 40 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        return
    fi

    temp=$(mktemp)

    awk -F"," -v id="$car_id" '
    $1!=id
    ' data/cars.txt > "$temp"

    mv "$temp" data/cars.txt

    log_action "Car Deleted ID=$car_id"

    dialog --msgbox "Car Deleted Successfully!" 6 40
}
delete_customer() {
    customer_id=$(dialog --inputbox "Enter Customer ID:" 8 40 3>&1 1>&2 2>&3)

    confirm=$(dialog --yesno "Delete Customer ID $customer_id?" 7 40 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        return
    fi

    temp=$(mktemp)

    awk -F"," -v id="$customer_id" '
    $1!=id
    ' data/customers.txt > "$temp"

    mv "$temp" data/customers.txt

    log_action "Customer Deleted ID=$customer_id"

    dialog --msgbox "Customer Deleted Successfully!" 6 40
}
delete_menu() {
    choice=$(dialog --menu "Delete Menu" 12 40 3 \
    1 "Delete Car" \
    2 "Delete Customer" \
    3 "Back" \
    2>&1 >/dev/tty)

    case $choice in
        1) delete_car ;;
        2) delete_customer ;;
        3) ;;
    esac
}
