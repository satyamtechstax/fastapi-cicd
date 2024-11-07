#!/bin/bash

SERVICE_NAME="fastapi.service"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"

# Check if the service exists
if systemctl list-units --type=service --all | grep -q "$SERVICE_NAME"; then
    echo "Stopping and disabling $SERVICE_NAME..."
    systemctl stop "$SERVICE_NAME"
    systemctl disable "$SERVICE_NAME"
    
    # Remove the service file if it exists
    if [ -f "$SERVICE_PATH" ]; then
        echo "Removing $SERVICE_NAME from systemd..."
        rm -f "$SERVICE_PATH"
        
        # Reload systemd manager configuration
        systemctl daemon-reload
        echo "$SERVICE_NAME has been completely removed."
    else
        echo "Service file $SERVICE_PATH does not exist. Nothing to remove."
    fi
else
    echo "$SERVICE_NAME does not exist. No action needed."
fi
