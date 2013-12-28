# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
system_name=

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Homebrew stuff (for Mac OS/X) - this has to be before the aliases so that we can do things like [ `which ack` ] in there
[ -d ~/.homebrew/bin ] && PATH=~/.homebrew/bin:$PATH

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -d ~/.aliases      ] && for alias_file in ~/.aliases/*; do . $alias_file; done

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ `uname -s` == 'Linux' ]; then
  [ -f ./etc/bash_completion ] && . /etc/bash_completion
  export EDITOR='vim'
else
  [ -f /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion
  export EDITOR='mate -w'
fi
for cf in ~/.bash_completion.d/*; do . $cf; done

if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

JAVA_HOME=/opt/jdk17
EDITOR=vim
FIGNORE="CVS:.swp:.svn"
PATH=$JAVA_HOME/bin:/var/lib/gems/1.8/bin/:$PATH:~/bin
AWT_TOOLKIT=MToolkit

# Amazon EC2 stuff
[ -f ~/.ec2rc ] && . ~/.ec2rc
[ -f ~/Projects/kahuna/etc/ec2/ec2rc ]  && . ~/Projects/kahuna/etc/ec2/ec2rc

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

# Setup the LANG so that gcc doesn't spit a^ characters instead of '
LANG=en_AU.UTF-8

export LD_LIBRARY_PATH
export LANG
export ORACLE_HOME

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
rvm use default

# Export all the things we've set up above
export JAVA_HOME EDITOR FIGNORE PATH AWT_TOOLKIT
