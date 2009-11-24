#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/benhoskings/dot-files.git .dot-files &&
ls -1d .dot-files/files/* .dot-files/files/.* | while read f; do
  [ "$f" == '.dot-files/files/.' ] ||
  [ "$f" == '.dot-files/files/..' ] ||
  [ "$f" == '.dot-files/files/.git' ] ||
  ln -vsf "$f" .
done
