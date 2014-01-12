#!/bin/bash

install_bin_file_from_url() {
  exe=$1
  url=$2
  if [ ! -f ${exe} ]; then
    echo "$url -> $exe"
    wget $url --quiet -O $exe
    chmod a+x $exe
  fi
}

clean_link()
{
  rm -f $2
  ln -s $1 $2
}

 ensure_brew_package()
{
  brew list | grep $1 > /dev/null && return
  brew install $1
}

install_mac_vim() {
  if [[ ! "$OSTYPE" == "darwin"* ]]; then return; fi
  mac_vim_path=/Applications/MacVim.app/Contents/MacOS/Vim
  if [ -f $mac_vim_path ]; then
    if [ ! -h /usr/bin/vim ]; then
      sudo mv /usr/bin/vim /usr/bin/vim72
      sudo ln -s $mac_vim_path /usr/bin/vim
    fi
  fi
}

install_brew_vim() {
  if [[ ! "$OSTYPE" == "darwin"* ]]; then return; fi
  ensure_brew_package "mercurial"
  ensure_brew_package "vim"
  if [ -f /usr/bin/vim ]; then sudo mv /usr/bin/vim /usr/bin/vim72; fi
}

install_standard_bin_files()
{
  install_bin_file_from_url ~/bin/selecta https://raw.github.com/nkpart/selecta/master/selecta
  clean_link ~/bin/selecta ~/bin/produca
  install_bin_file_from_url ~/bin/files   https://raw.github.com/nkpart/bin-files/master/files
  install_bin_file_from_url ~/bin/matcher https://raw.github.com/nkpart/bin-files/master/matcher
  install_bin_file_from_url ~/bin/bijecta https://raw.github.com/nkpart/bin-files/master/bijecta

  install_brew_vim
}

