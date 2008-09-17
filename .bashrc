export COLOR_NONE='\e[0m'
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED="\e[0;31m"
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

GIT_PIECE='$(__git_ps1 " \[${COLOR_RED}\]%s\[${COLOR_NONE}\]")'
export PS1="\u\[${COLOR_GREEN}\]@\[${COLOR_NONE}\]\h \[${COLOR_GRAY}\]\w\[${GIT_PIECE}\] \[${COLOR_GREEN}\]\$\[${COLOR_NONE}\] "
umask 022

export EDITOR='mate -w'
export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS='/opt/local/lib/ruby/gems/1.8/gems'

[ -f /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion

# bind "set show-all-if-ambiguous On" # complete first result on ambiguous tab

# coloured ls
if [ "$TERM" != "dumb" ]; then
    alias ls='ls -G'
    alias ll='ls -lhG'
    alias la='ls -aG'
    alias lal='ls -lhaG'
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
alias gitc='git commit'
