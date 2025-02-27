#!/bin/bash

# Directories
PROFILE_DIR="BaraProfiles"
VIP_DIR="BaraVIP"

# Ensure directories exist
mkdir -p "$PROFILE_DIR" "$VIP_DIR"

# Function to edit or add info to a profile
Update() {
	clear
    read -p "Enter profile name: " profile
    cat "$PROFILE_DIR/$profile"
    read -p "Enter info to add: " info
    file="$PROFILE_DIR/$profile"
    echo "$info" >> "$file"
    echo "Info added to $file"
}

# Function to view all personnel
VBP() {
	clear
    echo "Listing all Bara Profiles:"
    ls "$PROFILE_DIR"
    read -p "Press Enter to Continue..."
    clear 
}

# Function to view all VIPs
VVIP() {
	clear
    echo "Listing all Bara VIPs:"
    ls "$VIP_DIR"
    read -p "Press Enter to Continue..."
    clear 
}

# Function to read a specific profile or VIP file
READB() {
	clear
    read -p "Enter profile name: " profile
    
    if [ -f "$PROFILE_DIR/$profile" ]; then
        echo "Showing contents of $PROFILE_DIR/$profile:"
        cat "$PROFILE_DIR/$profile"
    elif [ -f "$VIP_DIR/$profile" ]; then
        echo "Showing contents of $VIP_DIR/$profile:"
        cat "$VIP_DIR/$profile"
    else
        echo "Profile not found."
    fi
    read -p "Press Enter to Continue..."
    clear
}

# Main menu
Menu() { clear
    while true; do
        echo "=============================================="
        echo " Welcome To Data Capturing - POWERED BY VICKI "
        echo "=============================================="
        echo " 1. Edit Profile/Add Info                                                                  "
        echo " 2. View All Bara Personnel                                                             "
        echo " 3. View All Bara VIP                                                                        "
        echo " 4. View Specific Acc                                                                       "
        echo " X. Exit                                                                                             "
        echo "=============================================="
        read -p "What would you like to do today? : " ans
        case $ans in
            1) Update;;
            2) VBP;;
            3) VVIP;;
            4) READB;;
            x|X) exit;;
            *) echo "Invalid option, try again.";;
        esac
    done
}

# Run the menu
Menu
