
#!/bin/sh
sudo apt update && sudo apt -y install \
cmake \
g++ \
git \
make
git clone https://github.com/opencv/opencv.git --branch master
echo "FIM"
