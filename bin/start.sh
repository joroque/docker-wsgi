#!/bin/bash

# Clone repository
# git clone https://urltomyrepo.
# git checkout -b <branch> origin/<branch>

# Install Python dependencies
/srv/venv/bin/pip install -r requirements.txt

# Start Supervisor
supervisord -l /var/log/supervisord.log -j /tmp/supervisord.pid
