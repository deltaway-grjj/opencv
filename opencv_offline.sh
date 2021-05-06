
#!/bin/sh
wget ftp://teste:@192.168.10.238/packages.tar.gz
tar -xzvf packages.tar.gz
sudo dpkg -i archives/*.deb
#wget -O ~/opencv/opencv.zip https://github.com/opencv/opencv/archive/master.zip
#unzip ~/opencv/opencv.zip
#unzip opencv/opencv.zip -d opencv/
wget ftp://teste:@192.168.10.238/opencv.tar.gz
tar -xzvf opencv.tar.gz
#mv ~/opencv/opencv-master ~/opencv/opencv
#mkdir -p ~/opencv/build && cd ~/opencv/build
#mkdir opencv/opencv-master/build
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-armhf"
#https://www.learnopencv.com/build-and-install-opencv-4-for-raspberry-pi/
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
#cmake -B ~/opencv/build/ -D ANT_EXECUTABLE=/usr/bin/ant -D BUILD_PERF_TESTS=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_opencv_apps=OFF -DBUILD_opencv_python=OFF -DCMAKE_BUILD_TYPE=Release -S ~/opencv/opencv
cmake -B opencv/opencv-master/build/ -D ANT_EXECUTABLE=/usr/bin/ant -D BUILD_PERF_TESTS=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_opencv_apps=OFF -DBUILD_opencv_python=OFF -DCMAKE_BUILD_TYPE=Release -S opencv/opencv-master/
#make -j4
make -j4 -C opencv/opencv-master/build/
sudo sed -i 's/CONF_SWAPSIZE=2048/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
