#!/bin/bash

ROS_DISTRO=kinetic

echo "Installing ROS distro $ROS_DISTRO"
sudo apt-get update --force-yes

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get --force-yes update
sudo apt-get --force-yes install -y libgl1-mesa-dev-lts-utopic vim vim-runtime tmux screen git curl wget ros-$ROS_DISTRO-desktop-full
sudo apt-get --force-yes update

echo "Creating racecar-ws workspace"
mkdir -p ~/racecar-ws/src
cd ~/racecar-ws/src
catkin_init_workspace
catkin_create_pkg lab2
cd ~/racecar-ws
curl -L https://raw.githubusercontent.com/mit-racecar/racecar/master/racecar-vm.rosinstall > .rosinstall
wstool update
# Update 3rd party ROS deps
rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y -r
catkin_make


echo "Setting up .bashrc"
cd ~/
curl -L https://raw.githubusercontent.com/mit-racecar/install_tools/master/bashrc_ending_vm.snippet >> ~/.bashrc

source ~/.bashrc
