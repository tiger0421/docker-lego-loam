#!/bin/bash

source /opt/ros/$(ls /opt/ros)/setup.bash


# create workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin build

# clone LeGO-LOAM
cd ~/catkin_ws/src
https://github.com/facontidavide/LeGO-LOAM-BOR.git
git clone https://github.com/koide3/ndt_omp
git clone https://github.com/koide3/odometry_saver.git
cd ..
catkin build
