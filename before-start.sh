#!/bin/bash
apt-get update
apt-get install -y build-essential unzip unrar
pip install --upgrade pip
REQUIREMENTS_FILE="/workspace/ComfyUI/requirements.txt"
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing dependencies from $REQUIREMENTS_FILE..."
    pip install -r "$REQUIREMENTS_FILE"
else
    echo "$REQUIREMENTS_FILE not found, skipping pip install."
fi
