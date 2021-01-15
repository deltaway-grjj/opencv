
#!/bin/sh
sudo apt update && sudo apt -y install \
cmake \
g++ \
git \
make \
ffmpeg
wget -O ~/opencv.zip https://github.com/opencv/opencv/archive/master.zip
unzip ~/opencv.zip
mv ~/opencv-master ~/opencv
mkdir -p ~/opencv/build && cd ~/opencv/build
#export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-armhf"
#https://www.learnopencv.com/build-and-install-opencv-4-for-raspberry-pi/
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
cmake -S ~/opencv -B ~/opencv/build/
sudo sed -i 's/CONF_SWAPSIZE=1024/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
