#!/bin/bash

# This script changes the password of a user that we want

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Ask for the username
read -p "Enter the username: " USERNAME

# Ask for the new password
read -p "Enter the new password: " NEW_PASSWORD
echo

# Change the user password
echo "$USERNAME:$NEW_PASSWORD" | chpasswd

# Check if the password was changed successfully
if [ $? -eq 0 ]; then
  echo "Password for user $USERNAME has been changed successfully."
else
  echo "Failed to change the password for user $USERNAME."
  exit 1
fi
