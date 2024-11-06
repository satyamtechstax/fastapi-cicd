#!/bin/bash

# Cleanup Actions
bash ./uninstall.sh
WORKDIR=$(pwd)
FLASK_DIR=$WORKDIR
FLASK_VENV=$WORKDIR/venv
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

cat << EOT > /etc/systemd/system/fastapi.service
[Unit]
Description=Flask Service
After=network.target

[Service]
WorkingDirectory=$FLASK_DIR
Environment="PATH=$FLASK_VENV/bin"
ExecStart=$FLASK_VENV/bin/python app.py
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

echo "Starting and Enabling Fast API service..."
systemctl start fastapi.service
systemctl enable fastapi.service
echo "Fast API service is started and enabled"