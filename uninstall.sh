#!/usr/bin/env bash

cur_path=`pwd`

#echo "initializing submodules"
#git submodule init
#git submodule update

echo "Uninstalling."
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.vimrc
rm -rf $cur_path/.vim
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.githelpers

echo "Done."
