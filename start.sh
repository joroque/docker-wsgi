#!/bin/bash

# Clone repository
# git clone https://urltomyrepo.

# Create virtual environment
# virtualenv .venv
# source .venv/bin/activate
# pip install -r requirements.txt

# Run Nginx and redirect stderr to stdout
nginx 2>&1

# Run Gunicorn and redirect stderr to stdout
#python wsgi.py &
