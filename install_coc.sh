#!/bin/bash

set -e # exit on first error

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
}

# MAIN
install_camodocal
