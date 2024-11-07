#!/bin/bash

source venv/bin/activate
pip install -r requirements.txt
echo "Restarting Fast API service..."
systemctl restart fastapi.service
echo "Restarted FastAPI service"