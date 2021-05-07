
#!/bin/sh
sudo apt update && sudo apt -y full-upgrade && sudo apt -y install \
ant \
autoconf \
autoconf-archive \
automake \
build-essential \
bzip2 \
ccache \
clang \
cmake \
default-jdk \
file \
ffmpeg \
freeglut3-dev \
gfortran \
git \
git-core \
gzip \
g++ \
libasound2-dev \
libass-dev \
libatlas-base-dev \
libavcodec-dev \
libavformat-dev \
libcanberra-gtk* \
libfreetype6-dev \
libgnutls28-dev \
libgtk-3-dev \
libgtk2.0-dev \
libjpeg-dev \
libpng-dev \
libprotobuf-dev \
libsdl2-dev \
libswscale-dev \
libtiff-dev \
libtool \
libusb-dev \
libv4l-dev \
libva-dev \
libvdpau-dev \
libvorbis-dev \
libx264-dev \
libxcb1-dev \
libxcb-shm0-dev \
libxcb-xfixes0-dev \
libxvidcore-dev \
make \
maven \
nasm \
openjdk-8-jdk \
patch \
perl \
pkg-config \
protobuf-compiler \
python \
swig \
tar \
texinfo \
unzip \
wiringpi \
wget \
xmlstarlet \
yasm \
zlib1g \
zlib1g-dev
wget -O ~/opencv/opencv.zip https://github.com/opencv/opencv/archive/master.zip
unzip ~/opencv/opencv.zip
mv ~/opencv/opencv-master ~/opencv/opencv
mkdir -p ~/opencv/build && cd ~/opencv/build
#export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-armhf"
#https://www.learnopencv.com/build-and-install-opencv-4-for-raspberry-pi/
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
cmake -B ~/opencv/build/ -D ANT_EXECUTABLE=/usr/bin/ant -D BUILD_PERF_TESTS=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_opencv_apps=OFF -DBUILD_opencv_python=OFF -DCMAKE_BUILD_TYPE=Release -S ~/opencv/opencv
make -j4
sudo sed -i 's/CONF_SWAPSIZE=1024/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
