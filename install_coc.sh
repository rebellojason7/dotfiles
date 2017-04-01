#!/bin/bash

set -e # exit on first error

install_opencv(){
    sudo apt-get install -y build-essential
    sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

    cd $HOME
    if [ ! -d "projects" ]; then
	mkdir projects	
    fi
    cd projects
    git clone https://github.com/opencv/opencv.git
    git clone https://github.com/opencv/opencv_contrib.git
    cd opencv
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DOPENCV_EXTRA_MODULES_PATH=$HOME/projects/opencv_contrib/modules -DBUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=/usr/local ..
    make -j8
    sudo make install
}

install_camodocal(){
    echo "Installing BLAS --------------------------------------"
    sudo apt-get install -y libblas-dev

    echo "Installing Boost -------------------------------------"
    sudo apt-get install -y libboost-all-dev
    
    echo "Installing Eigen3 ------------------------------------"
    sudo apt-get install -y libeigen3-dev
    
    echo "Installing Glog --------------------------------------"
    sudo apt-get install -y libgoogle-glog-dev
    sudo apt-get install -y libgoogle-glog-doc
    sudo apt-get install -y libgoogle-glog0v5

    echo "Installing Cuda --------------------------------------"
    sudo apt-get install -y nvidia-cuda-toolkit

    echo "Installing SuiteSparse -------------------------------"
    sudo apt-get install -y libsuitesparse-dev

    echo "Installing Gtest ------------------------------------"
    sudo apt-get install -y libgtest-dev

    echo "Installing Opencv -----------------------------------"
    install_opencv
}

# MAIN
install_camodocal

# Installing OpenCV
# cmake -DWITH_CUDA=ON -DBUILD_EXAMPLES=ON -DWITH_CUBLAS=ON -DWITH_NVCUVID=ON -DOPENCV_EXTRA_MODULES_PATH=/home/jrebello/projects/opencv_contrib/modules -DWITH_TBB=ON -DBUILD_PYTHON_SUPPORT=ON -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local ..
