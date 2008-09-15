git clone git://github.com/benhoskings/dot-files.git ~/.dot-files &&
cd &&
ls -1d .dot-files/.??* | while read f; do
  ln -s "$f" .
done
