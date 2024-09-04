#!/bin/bash

# function to read the user input
function get_input() {
  read -p "$1" input
  echo "$input"
}

# function that copies from host to the container
function copy_host_to_container() {
  container_id=$(get_input "Enter the container ID or name: ")
  host_path=$(get_input "Enter the file or directory path on the host: ")
  container_path=$(get_input "Enter the destination path into the container: ")

  docker cp "$host_path" "$container_id":"$container_path"
  echo "File copied from the host to the container successfully."
}

# function that copies from the container to the host
function copy_container_to_host() {
  container_id=$(get_input "Enter the container ID or name: ")
  container_path=$(get_input "Enter the path of the file or directory in the container: ")
  host_path=$(get_input "Enter the destination path on the host: ")

  docker cp "$container_id":"$container_path" "$host_path"
  echo "File copied from the container to the host successfully."
}

# options menu
echo "Choose the copy direction:"
echo "1. Copy from the host to container"
echo "2. Copy from the container to the host"

read -p "Option (1 or 2): " option

case $option in
  1)
    copy_host_to_container
    ;;
  2)
    copy_container_to_host
    ;;
  *)
    echo "Invalid option."
    ;;
esac

