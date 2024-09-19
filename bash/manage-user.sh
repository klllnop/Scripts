#!/bin/bash

# Add user
add_user() {
    read -p "Enter the username to add: " username
    read -p "Do you want to set a password for the user? (y/n): " set_password
    if [ "$set_password" = "y" ]; then
        sudo useradd "$username"
        sudo passwd "$username"
    else
        sudo useradd -m "$username"
        sudo passwd -d "$username"
        echo "User $username added successfully without password."
    fi
    echo "User $username added successfully."
}

# Remove user
remove_user() {
    read -p "Enter the username to remove: " username
    sudo userdel -r "$username"
    echo "User $username removed successfully."
}

# Change user password
change_password() {
    read -p "Enter the username to change the password for: " username
    sudo passwd "$username"
}

# Menu options
while true; do
    echo "Choose an option:"
    echo "1 - Add user"
    echo "2 - Remove user"
    echo "3 - Change user password"
    echo "4 - Exit"

    read -p "Enter the number of the desired option: " option

    case $option in
        1)
            add_user
            ;;
        2)
            remove_user
            ;;
        3)
            change_password
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
