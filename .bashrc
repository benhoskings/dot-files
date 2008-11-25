system_name=`uname -s`

if [ $system_name == 'Linux' ]; then
  . /etc/bash_completion
else
  . /opt/local/etc/bash_completion
fi

export color_none='\e[0m'
export color_white='\e[1;37m'
export color_black='\e[0;30m'
export color_blue='\e[0;34m'
export color_light_blue='\e[1;34m'
export color_green='\e[0;32m'
export color_light_green='\e[1;32m'
export color_cyan='\e[0;36m'
export color_light_cyan='\e[1;36m'
export color_red="\e[0;31m"
export color_light_red='\e[1;31m'
export color_purple='\e[0;35m'
export color_light_purple='\e[1;35m'
export color_brown='\e[0;33m'
export color_yellow='\e[1;33m'
export color_gray='\e[0;30m'
export color_light_gray='\e[0;37m'

. ~/.ps1_color
git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece='$(date "+%H:%M:%S")'
export PS1="\[${color_gray}\]${date_piece}\[${color_none}\] \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "
umask 022

export EDITOR='mate -w'
export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS='/opt/local/lib/ruby/gems/1.8/gems'
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
  PATH=/opt/local/bin:$PATH
fi

alias top='top -o cpu'
alias df='df -k'
alias du='du -k -d1'
alias less='less -R'

alias gits='git status'
alias gita='git add'
alias gitau='git add -u'
alias gitd='git diff'
alias gitdc='git diff --cached'
alias gitc='git commit -v'
alias gitsup='git pull && git submodule update'
