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

install_standard_bin_files() {
  install_bin_file_from_url ~/bin/selecta https://raw.github.com/nkpart/selecta/master/selecta
  clean_link ~/bin/selecta ~/bin/produca
  install_bin_file_from_url ~/bin/files   https://raw.github.com/nkpart/bin-files/master/files
  install_bin_file_from_url ~/bin/matcher https://raw.github.com/nkpart/bin-files/master/matcher
  install_bin_file_from_url ~/bin/bijecta https://raw.github.com/nkpart/bin-files/master/bijecta
}

