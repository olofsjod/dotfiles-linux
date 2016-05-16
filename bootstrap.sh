#!/usr/bin/env bash

##
# dotfiles install script
# Last modified: 2016-05-05

# Copyright (C) 2016  Olof Sjödin

# Wrote this as a practice to make good and robust
# bash scripts.

function cleanall {
    cleanlinks
    python3 cleaning.py
}

function cleanlinks {
    rm -r .links/*
}

function createfolderlinks {
    mkdir .links
    for d in include/*/; do
        newD=` echo $d | sed 's/^.*\/\(.*\)\/$/\1/'`
        ln -s `pwd`/$d .links/$newD
    done
}

function createlinksfromfolders {
    for i in confs/*/; do
        for f in $i*; do
            newF=` echo $f | sed 's/^.*\/\(.*\)$/\1/'`
            ln -s `pwd`/$f .links/$newF
        done
    done
}

function autocreatedir {
    result=`echo $1 | sed -e 's%\(.*\)/.*$%\1%'`

    if [[ $result != $1 ]]; then
        mkdir -pv $result
    fi
}

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

    t="$PWD/.links/$1"
    f="$HOME/.$1"

    if [[ ! -h $f ]]; then

        if [[ -e $f || -d $f ]]; then

            backup="$f"
            backup+=".bak"

            echo Backuping existing file or directory to $backup
            mv -v $f $backup
        fi

        autocreatedir $f
        ln -sv $t $f
    fi
}

function rmlink {
    t="$PWD/.links/$1"
    f="$HOME/.$1"

    if [[ -h $f ]]; then

        rm -v $f

        backup="$f"
        backup+=".bak"

        # check if a backup exist
        if [[ -e $backup ]]; then

            echo "Reverting $f to backup"
            mv -v $backup $f

        fi

    fi
}

function linktohome {
    for f in .links/*; do
        newF=` echo $f | sed 's/^.*\/\(.*\)$/\1/'`
        addlink $newF
    done
}


function gitinit {
    echo "Initializing git submodules"
    git submodule init
    git submodule update

    curl \
        -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
        -o $PWD/git-completion.bash
}

function fixvim {
    echo "Installing silently plugins to vim (try to hit enter if not
    responding)"

    
    mkdir -p $HOME/.vim/{colors,autoload,bundle}
    git clone https://github.com/VundleVim/Vundle.vim.git \
    ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall 
}

function install {
    echo "Bootstraping..."
    mkdir -p $HOME/.cache/zsh

    gitinit

    cleanall

    createfolderlinks
    createlinksfromfolders

    linktohome

    fixvim
}

install
