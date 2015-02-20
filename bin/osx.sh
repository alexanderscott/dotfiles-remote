#!/bin/bash

cd "$(dirname "$0")"

echo "   Installing custom binaries"

cp -f battery.sh /usr/local/bin/battery 
chmod +x /usr/local/bin/battery
