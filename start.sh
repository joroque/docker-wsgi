#!/bin/bash

# Clone repository
# git clone https://urltomyrepo.

# Install Python dependencies
/srv/venv/bin/pip install -r requirements.txt

# Run Nginx and redirect stderr to stdout
nginx 2>&1 &

# Run Gunicorn and redirect stderr to stdout
/srv/venv/bin/gunicorn -c gunicorn.conf wsgi:app 2>&1 &
