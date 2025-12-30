#!/bin/bash

echo "======== SYSTEM HEALTH REPORT ====="
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

echo "Apache status:"
systemctl is-active apache2

