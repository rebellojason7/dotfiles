#!/bin/bash

set -e # exit on first error

install_dependencies(){
	sudo apt-get update
	sudo apt-get install vim \
		xbacklight
}

git_config(){
	git config --global user.name "Jason Rebello"
	git config --global user.email "rebellojason7@gmail.com"
}

init(){
	install_dependencies
	git_config
}

# MAIN
init
