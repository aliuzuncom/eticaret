#!/bin/bash

echo "Starting deploy..."

cd /home/aliuzun/eticaret

source venv/bin/activate

git pull origin main

pip install -r requirements.txt

python manage.py migrate

python manage.py collectstatic --noinput

sudo systemctl restart gunicorn

echo "Deploy finished!"
