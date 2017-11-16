#!/bin/bash

    # 1. make sure you have fping installed
    # sudo apt-get install fping
    #
    # 2. make sure you are already logged in
    # vyprvpn login

    vyprvpn disconnect
    vyprvpn refresh

    TOP5=$(vyprvpn server list | awk '{print $1}' | grep ".vpn.goldenfrog.com" | fping -e -c 5 -q 2>&1 | awk -F'[ /]' '{print $16" "$1}' | sort -n | head -5)
    echo "Top 5 Servers"
    echo "$TOP5"

    vyprvpn server set $(echo $TOP5 | head -1 | awk '{print $2}')
    vyprvpn connect
