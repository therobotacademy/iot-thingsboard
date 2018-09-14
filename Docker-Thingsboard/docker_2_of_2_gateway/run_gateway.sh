#!/bin/bash

######################## INSTALLATION AND START UP OF IoT GATEWAY
dpkg -i /tb-gateway.deb

# Copying env variables into conf files
printenv | awk -F "=" '{print "export " $1 "='\''" $2 "'\''"}' # Output to terminal
printenv | awk -F "=" '{print "export " $1 "='\''" $2 "'\''"}' >> /usr/share/tb-gateway/conf/tb-gateway.conf

cat /usr/share/tb-gateway/conf/tb-gateway.conf

# Wait until log file is created
sleep 10
tail -f /var/log/tb-gateway/tb-gateway.log

echo "Starting 'IoT Gateway' service..."
service tb-gateway start
