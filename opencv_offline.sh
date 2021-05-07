
#!/bin/sh
wget ftp://teste:@192.168.10.238/packages.tar.gz
tar -xzvf packages.tar.gz
sudo dpkg -i archives/*.deb
wget ftp://teste:@192.168.10.238/opencv.tar.gz
tar -xzvf opencv.tar.gz
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
cmake -B opencv/build/ -D ANT_EXECUTABLE=/usr/bin/ant -D BUILD_PERF_TESTS=OFF -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_opencv_apps=OFF -DBUILD_opencv_python=OFF -DCMAKE_BUILD_TYPE=Release -S opencv
make -j4 -C opencv/build/
ls opencv/build/bin/
ls opencv/build/lib/
