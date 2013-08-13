#!/usr/bin/env bash

function use_zsh() {
  zsh=`which zsh`
  if [ $SHELL != $zsh ]
  then
    chsh -s $zsh
  fi
}

function link_configuration() {
  ls | while read f; do
    [ $f == "README.md" ] ||
    [ $f == "install.sh" ] ||

    ln -vsf "$PWD/$f" "$HOME/.$f"
  done
}

use_zsh
link_configuration
