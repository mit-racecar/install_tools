#!/bin/bash

# This file runs post install scripts for the TX1 board.

# Replace all occurances of 192.168.0.22 in the ~/.bashrc with the interface local IP
sed -i 's/192.168.0.22/`hostname -I`/g' ~/.bashrc
