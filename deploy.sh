#!/bin/bash

set -e  # herhangi bir hata olursa script dursun

echo "Starting deploy..."

cd /home/aliuzun/eticaret || exit 1

echo "Activating virtualenv..."
source venv/bin/activate

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Running migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Reloading gunicorn (zero-downtime)..."
sudo systemctl reload gunicorn

echo "✅ Deploy finished successfully!"
