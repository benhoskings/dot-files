#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Homebrew stuff (for Mac OS/X) - this has to be before the aliases so that we can do things like [ `which ack` ] in there
[ -d ~/.homebrew/bin ] && PATH=~/.homebrew/bin:$PATH

# Alias definitions.
source ~/.aliases/commands.sh
source_directory ~/.aliases
source_if_exists ~/.bash_aliases

# Search your history
bind "\C-p":history-search-backward
bind "\C-n":history-search-forward
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# history (bigger size, no duplicates, always append):
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTIGNORE="history*:fg:bg:vim"
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

if [ `uname -s` == 'Linux' ]; then
    source_if_exists ./etc/bash_completion
else # I guess this is Mac OS/X
    source_if_exists /opt/local/etc/bash_completion
fi
source_directory ~/.bash_completion.d
source_if_exists ~/.bash_prompt

# Amazon EC2 stuff
for i in ~/.ec2rc ~/Projects/kahuna/etc/ec2/ec2rc; do source_if_exists $i; done

# Oracle stuff
if [ -d /opt/oracle/instantclient_10_2 ]; then
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/oracle/instantclient_10_2
    ORACLE_HOME=/opt/oracle/instantclient_10_2
fi

# Postgres stuff (for Mac OS/X)
HOME_BREW_POSTGRES_DIR=/opt/local/lib/postgresql84/bin/
if [ -d $HOME_BREW_POSTGRES_DIR ]; then
    PATH=${HOME_BREW_POSTGRES_DIR}:${PATH}
fi

# Ruby Stuff -----------------------------------------------------------
# rvm
# if [[ -d ~/.rvm ]]; then
#     PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#     source_if_exists ~/.rvm/scripts/rvm
#     rvm use default # This loads RVM into a shell session.
# fi

# chruby
which brew && source_if_exists $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
# END: Ruby Stuff ------------------------------------------------------

# NVM Stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"


# PyEnv Stuff
eval "$(pyenv init -)"

# Node Stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Python Stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)" || true
eval "$(pyenv init -)" || true

# Haskell binaries on the path please
[ -d ~/Library/Haskell/bin ] && PATH=$PATH:~/Library/Haskell/bin
[ -d ~/.local/bin ] && PATH=$PATH:~/.local/bin

# Export all the things we've set up above
export JAVA_HOME=/opt/jdk17
export EDITOR=vim
export FIGNORE="CVS:.swp:.svn"
export PATH=$PATH:~/bin:$JAVA_HOME/bin
export LD_LIBRARY_PATH
export LANG=en_AU.UTF-8 # Setup the LANG so that gcc doesn't spit a^ characters instead of '
export ORACLE_HOME
export CIRCLE_API_TOKEN=f9c0f57d80044e8776a53f124a60bf0809cf8fe1

# Allow gistit to post gists as jamiecook
export GISTIT_TOKEN="5522c05955ac0cbf22c8c73c26b7c51fdc4783a2"
