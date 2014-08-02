#!/bin/sh
cd $(dirname $0)
for dotfile in .?*; do
    case $dotfile in
        ..)
            continue;;
        .git)
            continue;;
        *)
            ln -is "${PWD}/${dotfile}" $HOME
            ;;
    esac
done

if [ ! -d $HOME/vimbackup ]; then
    mkdir $HOME/vimbackup
    echo "create vimbackup directory."
fi

