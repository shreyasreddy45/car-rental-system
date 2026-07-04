add_customer() {

    name=$(dialog --inputbox "Enter Customer Name:" 8 40 3>&1 1>&2 2>&3)

    phone=$(dialog --inputbox "Enter Phone Number:" 8 40 3>&1 1>&2 2>&3)

    email=$(dialog --inputbox "Enter Email:" 8 40 3>&1 1>&2 2>&3)

    customer_id=$(( $(wc -l < data/customers.txt) + 201 ))

    echo "$customer_id,$name,$phone,$email" >> data/customers.txt
    log_action "Customer Added : ID=$customer_id Name=$name"

    dialog --msgbox "Customer Added Successfully! ID: $customer_id" 6 40
}

view_customers() {

    customer_list=$(awk -F"," '{
    printf "ID:%s Name:%s Phone:%s Email:%s\n",
    $1,$2,$3,$4
    }' data/customers.txt)

    dialog --title "Customer List" --msgbox "$customer_list" 20 80
}
