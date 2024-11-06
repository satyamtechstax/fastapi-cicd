#!/bin/bash
set -e
WORKDIR=$(pwd)
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cat << EOT > /etc/systemd/system/fastapi.service
[Unit]
Description=FastAPI Service
After=network.target

[Service]
WorkingDirectory=$WORKDIR
Environment="PATH=$WORKDIR/bin"
ExecStart=$WORKDIR/venv/python app.py
Restart=always
RestartSec=5
KillSignal=SIGQUIT
TimeoutStopSec=30
SyslogIdentifier=fastapi

[Install]
WantedBy=multi-user.target
EOT

echo "Reloading Systemd daemon..."
systemctl daemon-reload

# Start and enable the Uvicorn and Gunicorn services
echo "Starting and Enabling Fast API service..."
systemctl start fastapi.service
systemctl enable fastapi.service
echo "Fast API service is started and enabled"