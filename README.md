Setup all your config files in a git repo, BRILLIANT!

Installation
============

To install the main config files into your $HOME directory just download the clone and link script and run using ruby

    curl https://raw2.github.com/vlc/dot-files/master/clone_and_link.rb | ruby

If you aren't comfortable with running arbitary scripts directly off the internet (which you shouldn't be) download
the file, inspect it and run it manually.

After running this you will have a working set of config files linked into your home directory from their actual 
location at ~/.dot-files/files. Restart your bash session to get everything loaded up

### Binary files
There are a number of binary files that are useful to have available to you... to install the set that we think is
useful run the following command to download the appropriate files into your ~/bin directory

    install_standard_bin_files

### VIM

You'll also need to do some extra setup for vim and the associated bundles

1. Install vundle as per directions https://github.com/gmarik/vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

2. From vim run :BundleInstall



