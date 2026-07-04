search_car() {
    car_id=$(dialog --inputbox "Enter Car ID:" 8 40 3>&1 1>&2 2>&3)

    result=$(awk -F"," -v id="$car_id" '
    $1==id {
        printf "ID:%s\nModel:%s\nBrand:%s\nYear:%s\nRate:%s\nStatus:%s",
        $1,$2,$3,$4,$5,$6
    }
    ' data/cars.txt)

    if [ -z "$result" ]; then
        dialog --msgbox "Car not found!" 6 30
    else
        dialog --msgbox "$result" 15 40
    fi
}
search_customer() {
    customer_id=$(dialog --inputbox "Enter Customer ID:" 8 40 3>&1 1>&2 2>&3)

    result=$(awk -F"," -v id="$customer_id" '
    $1==id {
        printf "ID:%s\nName:%s\nPhone:%s\nEmail:%s",
        $1,$2,$3,$4
    }
    ' data/customers.txt)

    if [ -z "$result" ]; then
        dialog --msgbox "Customer not found!" 6 30
    else
        dialog --msgbox "$result" 15 40
    fi
}
search_menu() {
    choice=$(dialog --menu "Search" 12 40 3 \
    1 "Search Car" \
    2 "Search Customer" \
    3 "Back" \
    2>&1 >/dev/tty)

    case $choice in
        1) search_car ;;
        2) search_customer ;;
        3) ;;
    esac
}
