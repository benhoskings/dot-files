#!/bin/bash 
cd &&
<<<<<<< HEAD
[ -d '.dot-files' ] || git clone git://github.com/tomjadams/dot-files.git .dot-files &&
ls -1d .dot-files/files/* .dot-files/files/.* | while read f; do
=======
[ -d '.dot-files' ] || git clone git://github.com/vlc/dot-files.git .dot-files &&
ls -1d --color=none .dot-files/files/* .dot-files/files/.* | while read f; do
>>>>>>> 56f76cd8362457dd734519292e13614d63a79244
  [ "$f" == '.dot-files/files/.' ] ||
  [ "$f" == '.dot-files/files/..' ] ||
  [ "$f" == '.dot-files/files/.git' ] ||
  ln -vsF "$f" .
done
