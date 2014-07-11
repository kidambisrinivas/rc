#!/usr/bin/env bash

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
./configure --enable-pythoninterp --enable-rubyinterp --enable-perlinterp && sudo make && sudo make install
cd $HOME
sudo rm -rf vim
