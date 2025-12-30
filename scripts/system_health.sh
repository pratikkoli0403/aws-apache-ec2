#!/bin/bash

echo "===== SYSTEM HEALTH REPORT ====="
date
echo

echo "CPU Load:"
uptime
echo

echo "Memory Usage:"
free -h
echo

echo "Disk Usage:"
df -h
echo

echo "Apache Service Status:"
if systemctl is-active apache2 >/dev/null; then
    echo "Apache is RUNNING ✅"
else
    echo "Apache is NOT RUNNING ❌"
fi
echo

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Disk Usage Check:"
if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80% ❌"
else
    echo "Disk usage is normal ✅"
fi
echo

MEM_FREE=$(free | awk '/Mem/ {print $4}')

echo "Memory Check:"
if [ "$MEM_FREE" -lt 200000 ]; then
    echo "Low memory WARNING ❌"
else
    echo "Memory is sufficient ✅"
fi
