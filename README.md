# Installing Software for the MIT RACECAR platform


## Setting up your new Jetson TX1 board

```bash
#From a Ubuntu machine that's running version >= 14.04LTS

mkdir ~/MIT_RACECAR_OS
cd ~/MIT_RACECAR_OS

# Download flash utilities
wget -O Tegra210_Linux_R24.2.1_aarch64.tbz2 https://developer.nvidia.com/embedded/dlc/l4t-jetson-tx1-driver-package-24-2-1
bzip2 -d Tegra210_Linux_R24.2.1_aarch64.tbz2
tar xf Tegra210_Linux_R24.2.1_aarch64.tar
cd Linux_for_Tegra/bootloader

#Download the base image
wget https://dl.dropboxusercontent.com/u/380036122/BWSI/Software_Images/car_22_backup.img.tar.gz
tar -xzvf car_22_backup.img.tar.gz

# Connect your TX1 to your computer using USB
# Put the TX1 into DFU mode

# Flash the TX1, must use root privileges
sudo ./tegraflash.py --bl ./t210ref/cboot.bin --applet nvtboot_recovery.bin --chip 0x21 --cmd "write APP car_22_backup.img"

# Run postinstall script. This will prompt you for the current password (ubuntu)
# It will also prompt you for a new password
ssh ubuntu@YOUR_CAR_IP 'wget https://raw.githubusercontent.com/mit-racecar/install_tools/master/post_install_jetson.sh | bash'

# You can now SSH into the car using username: ubuntu, password: the password you entered above

# To access the default workspace for creating ROS packages that utilize MIT RACECAR components
cd ~/racecar-ws/src/
```
