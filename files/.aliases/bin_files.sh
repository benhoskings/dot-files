#!/bin/bash

install_bin_file_from_url() {
  exe=$1
  url=$2
  if [ ! -f ${exe} ]; then
    echo wget $url -O $exe
    wget $url -O $exe
    chmod a+x $exe
  fi
}

install_standard_bin_files() {
  install_bin_file_from_url ~/bin/selecta https://raw.github.com/nkpart/selecta/master/selecta
  install_bin_file_from_url ~/bin/files   https://raw.github.com/nkpart/bin-files/master/files
}

