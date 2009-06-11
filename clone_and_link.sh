#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/benhoskings/dot-files.git .dot-files &&
ls -1d .dot-files/.* | while read f; do
  [ "$f" == '.dot-files/.' ] ||
  [ "$f" == '.dot-files/..' ] ||
  [ "$f" == '.dot-files/.git' ] ||
  ln -vsf "$f" .
done
