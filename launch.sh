#!/bin/bash
xhost +local:root

IMAGE_NAME=$1

docker run -it --rm --name ros \
    -v ~/share:/root/share \
    -v ~/ros_ws/catkin_orne_kinetic_ws:/root/catkin_ws \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    ${IMAGE_NAME:-tiger0421/ros-gpu-gazebo:1.0-glvnd-runtime-ubuntu18.04} \
    /bin/bash

xhost -local:root
