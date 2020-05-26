ARG BASE_TAG
FROM tiger0421/ros-gpu-gazebo:$BASE_TAG

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
        unzip && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/Downloads
RUN wget -O /root/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip && \
    cd ~/Downloads/ && unzip gtsam.zip -d ~/Downloads/ && \
    cd ~/Downloads/gtsam-4.0.0-alpha2/ && \
    mkdir build && cd build && \
    cmake .. && \
    make install

WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/RobustFieldAutonomyLab/LeGO-LOAM.git && \
    cd .. && \
    catkin build
WORKDIR /root
