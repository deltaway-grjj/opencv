
#!/bin/sh
sudo apt update && sudo apt -y install \
cmake \
g++ \
git \
make \
ffmpeg
wget -O ~/opencv.zip https://github.com/opencv/opencv/archive/master.zip
unzip opencv.zip
mv ~/opencv-master ~/opencv
mkdir -p ~/opencv/build && cd ~/opencv/build
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
cmake -S ~/opencv -B ~/opencv/build/
