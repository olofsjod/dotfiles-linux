#!/usr/bin/env bash

  #########################
## dotfiles install script ##
## by medik         v0.0.1 ##
  #########################

# Wrote this as a practice to make good and robust
# bash scripts. 

# Copyright (C) 2015  Olof Sjödin

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

echo -e "dotfiles installation script v0.0.1 \n"
echo "Copyright (C) 2015  Olof Sjödin"
echo "This program comes with ABSOLUTELY NO WARRANTY."
echo -e "This is free software, and you are welcome to redistribute it under certain conditions.\n"

declare -a dotfiles=("bash_profile" "bashrc" "vimrc" "vim" "gvimrc" "gitconfig" "gitignore" "githelpers" "Xresources" "conkyrc" "aliases" "git-completion.bash" "zshrc")

function ask {
    while true; do read yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) echo -e "Aborting.\n"; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function addlink {
    echo "Adding link to $1"
    t="$PWD/$1"
    f="$HOME/.$1"
    if [[ ! -h $f ]]; then
        if [[ -e $f || -d $f ]]; then
            backup="$f"
            backup+=".bak"
            echo Backuping existing file or directory to $backup
            mv -v $f $backup
        fi
        ln -sv $t $f
    fi
}

function rmlink {
    t="$PWD/$1"
    f="$HOME/.$1"
    if [[ -h $f ]]; then
        rm -v $f
    fi
}

function uninstall {
    echo "Running uninstall script"
    echo "Will try to remove any links (to dotfiles that this program provides) that are in $HOME"
    echo "Are you sure? (y/N)"

    ask

    for i in "${dotfiles[@]}"; do
        rmlink $i
    done
}

function install {
    echo "Running install script"
    mkdir -p $PWD/vim/{colors,autoload}

    echo "Initializing git submodules"
    git submodule init
    git submodule update

    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $PWD/git-completion.bash

    for i in "${dotfiles[@]}"; do
        addlink $i
    done

    echo "Installing silently plugins to vim"
    vim +PluginInstall +qall > /dev/null 2>&1
}

case "$1" in
    install)
        install;;
    uninstall)
        uninstall;;
    *)
        echo $"Usage: $0 {install|uninstall}"
        exit 1
esac
