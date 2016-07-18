#!/usr/bin/env sh
echo 'installing ros'

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get -y update
sudo apt-get -y install libgl1-mesa-dev-lts-utopic vim tmux 
sudo apt-get -y install ros-indigo-desktop-full
sudo apt-get -y install ros-indigo-ackermann-msgs

sudo apt-get -y update

sudo apt-get -y install ros-indigo-controller-manager ros-indigo-gazebo-ros-control ros-indigo-gazebo-ros-pkgs ros-indigo-joint-state-controller ros-indigo-effort-controllers

mkdir -p ~/racecar-ws/src
cd ~/racecar-ws/src
git clone https://github.com/mit-racecar/racecar-simulator.git
git clone https://github.com/mit-racecar/racecar.git
git clone https://github.com/mit-racecar/vesc.git

cd ~/racecar-ws
catkin_init_workspace
catkin_make





