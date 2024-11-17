#!/bin/bash

function view_aliases {
    echo "Current Aliases in ~/.bashrc:"
    grep '^alias ' ~/.bashrc || echo "No aliases found."
    echo
}

function add_modify_alias {
    echo "Enter the alias name (e.g., myalias):"
    read alias_name
    echo "Enter the command for the alias (e.g., ls -la):"
    read alias_command

    # Check if already exists
    if grep -q "^alias $alias_name=" ~/.bashrc; then
        # Modify existing alias
        sed -i "/^alias $alias_name=/c\alias $alias_name='$alias_command'" ~/.bashrc
        echo "Alias '$alias_name' modified successfully."
    else
        # Add new alias
        echo "alias $alias_name='$alias_command'" >> ~/.bashrc
        echo "Alias '$alias_name' added successfully."
    fi
}

function remove_alias {
    echo "Enter the alias name to remove:"
    read alias_name

    # Check if the alias exists and remove it
    if grep -q "^alias $alias_name=" ~/.bashrc; then
        sed -i "/^alias $alias_name=/d" ~/.bashrc
        echo "Alias '$alias_name' removed successfully."
    else
        echo "Alias '$alias_name' not found."
    fi
}

while true; do
    echo "Choose an option:"
    echo "1. View aliases"
    echo "2. Add/Modify an alias"
    echo "3. Remove an alias"
    echo "4. Exit"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1) view_aliases ;;
        2) add_modify_alias ;;
        3) remove_alias ;;
        4) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please select 1, 2, 3, or 4." ;;
    esac

    source ~/.bashrc
done

