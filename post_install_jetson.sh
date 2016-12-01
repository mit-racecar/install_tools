#!/bin/bash

# This file runs post install scripts for the TX1 board.
echo "Running post install for MIT RACECAR"

# Replace all occurances of 192.168.0.22 in the ~/.bashrc with the interface local IP
sed -i 's/192.168.0.22/`hostname -I`/g' ~/.bashrc

# Prompt the user for a new password
echo "Please change the default password for user ubuntu"
echo "The default password is: ubuntu"
passwd ubuntu
