system_name=`uname -s`

. ~/.aliases/colours
. ~/.ps1_color

#git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "
umask 022

if [ $system_name == 'Linux' ]; then
  . /etc/bash_completion

  export EDITOR='vim'
else
  . /opt/local/etc/bash_completion

  export EDITOR='mate -w'
fi

export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS="`gem env gemdir`/gems"
export HISTSIZE=1000000

bind "set show-all-if-ambiguous On"

shopt -s globstar

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

alias df='df -h'
alias less='less -R'

. ~/.aliases/git
. ~/.aliases/svn
. ~/.aliases/commands
