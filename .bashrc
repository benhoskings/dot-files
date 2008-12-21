system_name=`uname -s`

if [ $system_name == 'Linux' ]; then
  . /etc/bash_completion
else
  . /opt/local/etc/bash_completion
fi

. ~/.aliases/colours
. ~/.ps1_color

git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]$(date "+%a %H:%M:%S")\[${color_none}\]"
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "
umask 022

export EDITOR='mate -w'
export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS="`gem env gemdir`/gems"
export HISTSIZE=100000

bind "set show-all-if-ambiguous On"

# coloured ls
if [ "$TERM" != "dumb" ]; then
  if [ $system_name == 'Linux' ]; then
    color_option='--color=auto'
  else
    color_option='-G'
  fi

  alias ls="ls $color_option"
  alias ll="ls -lh $color_option"
  alias la="ls -a $color_option"
  alias lal="ls -lha $color_option"
else
  # TODO use path_helper to do this properly
  export PATH=/opt/local/bin:$PATH
fi

alias top='top -o cpu'
alias df='df -k'
alias du='du -k -d1'
alias less='less -R'

. ~/.aliases/git
