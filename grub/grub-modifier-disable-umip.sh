#!/bin/bash

# Disclaimer
echo "DISCLAIMER: Use it at your own risk."


#Some small explanation what umip is: 
#UMIP is a feature that disables certain CPU instructions from being run by 
#user-space (non-root) applications. 
#When the app tries to run them, it instantly crashes. 
#However, as everything in wine runs in user-space, 
#UMIP can cause problems for some windows apps that require the cpu instructions. 
#Disabling it bypasses these problems. 
#I don't think it should affect anything else
#the only thing is that it ^might^ fix apps that was crashing for unknown reason

# Menu options
echo "Select an option:"
echo "1. Modify GRUB"
echo "2. Restore GRUB backup"
read -p "Option: " option

if [ $option -eq 1 ]
then
    FACTORY_GRUB="/etc/default/grub"
    BACKUP1="/etc/default/grub.bak"
    BACKUP2="$HOME/Desktop/grub.bak"

    if [ -f "$BACKUP1" ] && [ -f "$BACKUP2" ]
    then
        echo "Backup file already exists. Skipping backup."
    else
        echo "Creating backup file in two locations..."
        echo "-> $BACKUP1" 
        echo "and" 
        echo "-> $BACKUP2"
        sleep 1
        echo ".........."
        sudo cp "$FACTORY_GRUB" "$BACKUP1"
        sudo cp "$FACTORY_GRUB" "$BACKUP2"
        echo "Backup files created."
        echo
    fi

    # Modify GRUB
    echo "Modifying GRUB..."
    sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/"$/ clearcpuid=umip"/' /etc/default/grub &
    sleep 2
    echo "GRUB modified successfully."

    # Update GRUB
    echo "Updating GRUB settings..."
    echo
    sudo update-grub
    echo
    echo "GRUB settings updated."



    # Restart
    sleep 2
    echo "Restarting in 10 seconds..."
    for i in {10..1}; do
        echo -ne "$i seconds remaining.\r"
        sleep 1
    done
    echo -ne "Restarting now!      \n"
    sudo shutdown -r now

elif [ $option -eq 2 ]
then
    # Restore GRUB backup
    if [ -f /etc/default/grub.bak ]
    then
        echo "Restoring GRUB backup..."
        sudo cp /etc/default/grub.bak /etc/default/grub
        echo "GRUB backup restored."
        echo "Changes will take effect on next restart."
    else
        echo "Backup file not found. Skipping restore."
    fi

else
    echo "Invalid option. Please try again."
fi

