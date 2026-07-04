total_revenue() {
    revenue=$(awk -F"," '
    $8=="Completed" {
        sum += $6 + $7
    }
    END {
        print sum
    }
    ' data/rentals.txt)

    dialog --msgbox \
    "Total Revenue: ₹$revenue" \
    8 40
}
active_rentals() {
    rentals=$(awk -F"," '
    $8=="Ongoing" {
        printf "Rental:%s Car:%s Customer:%s\n",
        $1,$3,$2
    }
    ' data/rentals.txt)
    dialog --msgbox "$rentals" 20 60
}
available_cars() {
    cars=$(awk -F"," '
    $6=="Available" {
        printf "ID:%s %s %s\n",
        $1,$2,$3
    }
    ' data/cars.txt)
    dialog --msgbox "$cars" 20 60
}
late_returns() {
    fines=$(awk -F"," '
    $7>0 {
        printf "Rental:%s Fine:%s\n",
        $1,$7
    }
    ' data/rentals.txt)
    dialog --msgbox "$fines" 20 60
}
