#!/bin/bash
set -e
echo "Stoping and disabling fastAPI service..."
systemctl stop fastapi.service
systemctl disabled fastapi.service
echo "Uninstalled Fast API service"
