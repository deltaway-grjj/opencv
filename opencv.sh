
#!/bin/sh
sudo apt update && sudo apt -y install \
cmake \
g++ \
git \
make
wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip
unzip opencv.zip
mv opencv-master opencv
mkdir -p build && cd build
cmake -S /home/pi/opencv
echo "FIM"
