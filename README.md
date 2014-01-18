Setup all your config files in a git repo, BRILLIANT!

Installation
============

To install the main config files into your $HOME directory just download the clone and link script and run using ruby

    curl https://raw2.github.com/vlc/dot-files/master/clone_and_link.rb | ruby

If you aren't comfortable with running arbitary scripts directly off the internet (which you shouldn't be) download
the file, inspect it and run it manually.

VIM
---

You'll also need to do some extra setup for vim and the associated bundles

# Install vundle as per directions https://github.com/gmarik/vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# From vim run :BundleInstall



