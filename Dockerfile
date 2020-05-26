ARG BASE_TAG
FROM tiger0421/ros-gpu-gazebo:$BASE_TAG

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
        unzip \
        ros-$(ls /opt/ros)-geodesy \
	ros-$(ls /opt/ros)-pcl-ros \
	ros-$(ls /opt/ros)-nmea-msgs \
	ros-$(ls /opt/ros)-libg2o && \
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
COPY docker-entrypoint.sh /tmp
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD ["/bin/bash"]
WORKDIR /root
