add_car() {

    model=$(dialog --inputbox "Enter Car Model:" 8 40 3>&1 1>&2 2>&3)

    brand=$(dialog --inputbox "Enter Car Brand:" 8 40 3>&1 1>&2 2>&3)

    year=$(dialog --inputbox "Enter Car Year:" 8 40 3>&1 1>&2 2>&3)

    rate=$(dialog --inputbox "Enter Daily Rental Rate:" 8 40 3>&1 1>&2 2>&3)

    car_id=$(( $(wc -l < data/cars.txt) + 101 ))

    echo "$car_id,$model,$brand,$year,$rate,Available" >> data/cars.txt
    log_action "Car Added : ID=$car_id Model=$model"

    dialog --msgbox "Car Added Successfully! ID: $car_id" 6 40
}

view_cars() {

    car_list=$(awk -F"," '{
    printf "ID:%s Model:%s Brand:%s Year:%s Rate:%s Status:%s\n",
    $1,$2,$3,$4,$5,$6
    }' data/cars.txt)

    dialog --title "Car List" --msgbox "$car_list" 20 80
}
