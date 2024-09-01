#!/bin/bash
apt-get update
apt-get install -y build-essential unzip unrar
pip install --upgrade pip
pip install -r /workspace/ComfyUI/requirements.txt
