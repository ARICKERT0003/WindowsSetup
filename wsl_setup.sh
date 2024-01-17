#!/bin/bash

apt install g++ build-essential

apt install cmake
apt install cmake-curses-gui

apt install doxygen

apt install libboost-all-dev

apt install git
git config --global user.email "ARICKERT0003@gmail.com"
git config --global user.name "Alex"
git config --global core.editor "vim"

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
mkdir ~/.config

