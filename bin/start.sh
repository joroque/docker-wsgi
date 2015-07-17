#!/bin/bash
supervisord -l /var/log/supervisord.log -j /var/run/supervisord.pid
