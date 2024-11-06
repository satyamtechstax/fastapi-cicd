#!/bin/bash
echo "Stoping and disabling fastAPI service..."
systemctl stop fastapi.service
systemctl disable fastapi.service
echo "Uninstalled Fast API service"
