# Installing Software for the MIT RACECAR platform


## Setting up your new Jetson TX1 board

```bash
#From a Ubuntu machine that's running version >= 14.04LTS

mkdir ~/MIT_RACECAR_OS
cd ~/MIT_RACECAR_OS

# Download flash utilities
wget https://developer.nvidia.com/embedded/dlc/l4t-jetson-tx1-driver-package-24-2-1
bzip2 -d Tegra210_Linux_R24.2.1_aarch64.tbz2
cd Linux_for_Tegra/bootloader

#Download the base image
wget https://dl.dropboxusercontent.com/u/380036122/BWSI/Software_Images/car_22_backup.img.tar.gz
tar -xzvf car_22_backup.img.tar.gz

# Connect your TX1 to your computer using USB
# Put the TX1 into DFU mode

# Flash the TX1
.tegraflash.py --bl cboot.bin --applet nvtboot_recovery.bin --chip 0x21 --cmd "write APP car_22_backup.img"

# You can now SSH into the car using username: ubuntu, password: ubuntu
# Don't forget to change the password!!
```
