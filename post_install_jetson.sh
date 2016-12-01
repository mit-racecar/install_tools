#!/bin/bash

# This file runs post install scripts for the TX1 board.
echo "Running post install for MIT RACECAR"

# Replace all occurances of 192.168.0.22 in the ~/.bashrc with the interface local IP
echo "Updating ~/.bashrc"
sed -i 's/192.168.0.22/`hostname -I`/g' ~/.bashrc

# Make sure that the rosinstall is up to date
echo "Updating ~/racecar-ws/.rosinstall"
wget -q https://raw.githubusercontent.com/mit-racecar/racecar/master/racecar.rosinstall -O ~/racecar-ws/src/.rosinstall

# Update workspace
echo "Updating ~/racecar-ws/src from github"
cd ~/racecar-ws/src && wstool update

# Prompt the user for a new password
echo "Please change the default password for user ubuntu"
echo "The default password is: ubuntu"
passwd ubuntu
