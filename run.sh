#!/bin/bash

# Run Nginx and redirect stderr to stdout
nginx 2>&1


# Run Gunicorn
#python wsgi.py &
