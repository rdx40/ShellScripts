#!/bin/bash
# User management script

echo "1. Add User"
echo "2. Delete User"
echo "3. Modify User"
read -p "Choose an option: " OPTION

if [ "$OPTION" == "1" ]; then
    read -p "Enter username to add: " USERNAME
    sudo adduser "$USERNAME"
    echo "User $USERNAME added."

elif [ "$OPTION" == "2" ]; then
    read -p "Enter username to delete: " USERNAME
    sudo deluser --remove-home "$USERNAME"
    echo "User $USERNAME deleted."

elif [ "$OPTION" == "3" ]; then
    read -p "Enter username to modify: " USERNAME
    sudo usermod -aG sudo "$USERNAME"
    echo "User $USERNAME granted sudo privileges."
else
    echo "Invalid option."
fi

