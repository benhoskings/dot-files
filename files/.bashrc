# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
system_name=

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
for alias_file in ~/.aliases/*; do . $alias_file; done

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    # dircolors doesn't exist on mac osx
    if [ `which dircolors` ]; then eval "`dircolors -b`"; fi
    if [ `uname -s` == 'Linux' ]; then
        alias ls='ls --color=auto'
    else
        alias ls='ls -G'
    fi

    export GREP_OPTIONS='--color=auto'
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

GREY="\[\033[01;30m\]"
GREEN="\[\033[01;32m\]"
YELLOW="\[\033[01;33m\]"
LIGHT_YELLOW="\e[38;05;3m"
#BLUE="\[\033[01;33m\]"
BLUE="\[\033[01;34m\]"
WHITE="\[\033[00m\]"
WHITE="\[\033[01;37m\]"
export GREY BLUE GREEN HUH HUH2
case "$USER" in
root)
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;101m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  ;;
*)
  PS1="${debian_chroot:+($debian_chroot)}${GREY}\$(date +%Y%m%d\ %H:%M:%S) ${LIGHT_YELLOW}\u${GREY}@${BLUE}\h${WHITE}:${GREEN}\w${WHITE}${GREY}\$(__git_ps1)${WHITE} "
  ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

JAVA_HOME=/opt/jdk16
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

# Homebrew stuff (for Mac OS/X)
[ -d ~/.homebrew/bin ] && PATH=~/.homebrew/bin:$PATH

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
