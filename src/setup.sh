#!/bin/bash
set -e

echo "Creating venv..."
python3 -m venv venv

echo "Activating..."
source venv/bin/activate

echo "Installing..."
pip install --upgrade pip
pip install requests pandas python-dotenv

echo "Done. Activate with: source venv/bin/activate"
