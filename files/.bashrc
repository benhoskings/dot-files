system_name=`uname -s`

. ~/.aliases/colours
. ~/.ps1_color

#git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "
umask 022

if [ $system_name == 'Linux' ]; then
  [ -f /etc/bash_completion ] && . /etc/bash_completion
  export EDITOR='vim'
else
  [ -f /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion
  export EDITOR='mate -w'
fi

export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS="`gem env gemdir`/gems"
export HISTSIZE=1000000

bind "set show-all-if-ambiguous On"

#shopt -s globstar

# coloured ls
if [ "$TERM" != "dumb" ]; then
  if [ $system_name == 'Linux' ]; then
    color_option='--color=auto'

    alias du='du -k --max-depth=1'
  else
    color_option='-G'

    alias du='du -k -d1'
    alias top='top -o cpu'

    alias vi='mate'
  fi

  alias ls="ls $color_option"
  alias ll="ls -lh $color_option"
  alias la="ls -a $color_option"
  alias lal="ls -lha $color_option"

  . ~/.scripts/j.sh

else
  # TODO use path_helper to do this properly
  export PATH=/opt/local/bin:$PATH
fi


# sets the title window
case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD}\007"'
        ;;
    vt100*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD}\007"'
        ;;
    *)
        PROMPT_COMMAND='${USER}@${HOSTNAME%%.*}:${PWD}"'
        ;;
esac

# disable the discard character (so ^O works in bash)
stty discard undef

# set the umask to something reasonable
umask 007

bind "C-p":history-search-backward
bind "C-n":history-search-forwardp

PATH=${PATH}:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/.gem/ruby/1.8/bin:~/.cabal/bin

### Environment variables ###
JAVA_HOME=/Library/Java/Home
PATH=/opt/scala/bin:/opt/maven/bin:/usr/local/bin:/usr/local/sbin:~/bin:${PATH}
FIGNORE="CVS:.swp:.DS_Store:.svn"

export PATH PS1 EDITOR FIGNORE JAVA_HOME ANT_HOME
#export http_proxy=http://username:password@host:port/
#export http_proxy=http://proxy.uq.net.au:80

if [ -f ~/Projects/Personal/dot-files/git-prompt.sh ]; then
  . ~/Projects/Personal/dot-files/git-prompt.sh
fi

. ~/.aliases/git

function go () {
  PROJECT_DIRS="$HOME/p/mogen/projects $HOME/p/mogen/projects/oomph-clients $HOME/railscamp $HOME/p/mogen/kits"
  cd `find $PROJECT_DIRS -maxdepth 1 | grep \/$1 | head -n 1`
}



. ~/.aliases/git
. ~/.aliases/svn
. ~/.aliases/commands
