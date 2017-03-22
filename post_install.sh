#!/bin/bash

ROS_DISTRO=kinetic

echo "Installing ROS distro $ROS_DISTRO"
sudo apt-get update

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get update
sudo apt-get install -y libgl1-mesa-dev-lts-utopic vim vim-runtime tmux screen git curl wget ros-$ROS_DISTRO-desktop-full python-wstool
sudo apt-get update

# Get ROS commands
source /opt/ros/$ROS_DISTRO/setup.bash

echo "Setting up .bashrc"
cd ~/
curl -L https://raw.githubusercontent.com/mit-racecar/install_tools/master/bashrc_ending_vm.snippet > ~/bash_include_6.141
echo "## Include settings for 6.141 ##" >> ~/.bashrc
echo "source ~/bash_include_6.141 " >> ~/.bashrc
source ~/.bashrc

echo "Creating racecar-ws workspace"
mkdir -p ~/racecar-ws/src
cd ~/racecar-ws/src
catkin_init_workspace
catkin_create_pkg lab2

cd ~/racecar-ws
curl -L https://raw.githubusercontent.com/mit-racecar/racecar/master/racecar-vm.rosinstall > .rosinstall
wstool update

# Update 3rd party ROS deps
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y -r

# Refresh ROS commands
source /opt/ros/$ROS_DISTRO/setup.bash
catkin_make



