#!/bin/bash

echo "====== Linux Package Operations Manager ======"

echo ""
echo "Select an option:"
echo "1. Update system"
echo "2. Install package"
echo "3. Remove package"
echo "4. Check package installed or not"

echo ""
read -p "Enter your choice: " choice

if [ "$choice" -eq 1 ]; then
    sudo apt update && sudo apt upgrade -y
    echo "System updated successfully"

elif [ "$choice" -eq 2 ]; then
    read -p "Enter package name to install: " pkg
    sudo apt install -y "$pkg"
    echo "Package installed: $pkg"

elif [ "$choice" -eq 3 ]; then
    read -p "Enter package name to remove: " pkg
    sudo apt remove -y "$pkg"
    echo "Package removed: $pkg"

elif [ "$choice" -eq 4 ]; then
    read -p "Enter package name to check: " pkg

    if rpm -q "$pkg" >/dev/null 2>&1; then
        echo "Package is installed: $pkg"
    else
        echo "Package is not installed: $pkg"
    fi

else
    echo "Invalid option"
fi

echo ""
echo "=============================================="
