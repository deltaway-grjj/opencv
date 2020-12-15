
#!/bin/sh
sudo apt-get update && sudo apt-get -y install \
cmake \
g++ \
git \
make
git clone https://github.com/opencv/opencv.git --branch master
echo "FIM"
