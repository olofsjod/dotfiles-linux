#!/usr/bin/env bash

echo "Uninstalling."

rm -f {~/.bash_profile,~/.bashrc,~/.vimrc,~/.vim,~/.gvimrc,~/.gitconfig,\
~/.gitignore,~/.githelpers,~/.Xresources,~/.conkyrc,~/.aliases,~/git-completion.bash}

echo "Done."
