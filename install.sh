#!/bin/bash

ROS_DISTRO=$(ls /opt/ros)
source /opt/ros/$ROS_DISTRO/setup.bash


# create workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin build

# clone LeGO-LOAM
cd ~/catkin_ws/src
git clone https://github.com/RobustFieldAutonomyLab/LeGO-LOAM.git
cd ..
catkin build
