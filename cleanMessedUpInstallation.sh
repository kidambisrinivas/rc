#!/usr/bin/env bash

rm -rf ~/perl5
rm -rf ~/.vim
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -rf ~/.linuxbrew
sed '/linuxbrew/d' ~/.bashrc > ~/.bashrc
