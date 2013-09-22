#!/usr/bin/env bash

cur_path=`pwd`

#echo "initializing submodules"
#git submodule init
#git submodule update

echo "Uninstalling."
rm -rf $cur_path/.vim
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.githelpers
rm ~/.conkyrc
rm ~/.Xresources
rm ~/.aliases

echo "Done."
