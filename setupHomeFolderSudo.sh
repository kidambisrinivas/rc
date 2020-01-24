#!/bin/bash

# For Linuxbrew
sudo apt-get -y install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev 

# For YouCompleteMe
sudo apt-get -y install python-dev

# General
sudo apt-get -y install zip unzip

# Ship latest Vim
cd $HOME
sudo apt-get remove vim
sudo apt-get -y install mercurial ncurses-dev
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src

# Setup python 3.7
# If apt-get update fails, then remove unnecessary/old ppas from /etc/apt/sources.list.d/*
cd /usr/lib/python3/dist-packages/
sudo ln -s apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.so
sudo apt update; sudo apt install software-properties-common; sudo add-apt-repository ppa:deadsnakes/ppa
sudo ln -s python3.7 ./python3
sudo apt-get update && sudo apt-get install python3.7

sudo ./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --enable-rubyinterp
sudo make && sudo make uninstall && sudo make install

cd $HOME
sudo rm -rf vim

