#!/usr/bin/env sh
echo 'installing ros'
sudo apt-get update --force-yes

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

sudo apt-get --force-yes update
sudo apt-get --force-yes install libgl1-mesa-dev-lts-utopic vim tmux git
sudo apt-get --force-yes install ros-indigo-desktop-full
sudo apt-get --force-yes install ros-indigo-ackermann-msgs

sudo apt-get --force-yes update

mkdir -p ~/racecar-ws/src
cd ~/racecar-ws/src
git clone https://github.com/mit-racecar/racecar-simulator.git
git clone https://github.com/mit-racecar/racecar.git
git clone https://github.com/mit-racecar/vesc.git


sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get --force-yes update

sudo apt-get --force-yes install ros-indigo-controller-manager ros-indigo-gazebo-ros-control ros-indigo-gazebo-ros-pkgs ros-indigo-joint-state-controller ros-indigo-effort-controllers



cd ~/racecar-ws
catkin_init_workspace
catkin_make





