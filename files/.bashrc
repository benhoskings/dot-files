. ~/.aliases/colours
. ~/.ps1_color

system_name=`uname -s`

function go () {
  PROJECT_DIRS="$HOME/Projects"
  cd `find $PROJECT_DIRS -maxdepth 2 | grep \/$1 | head -n 1`
}

git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
# umask 022

#alias git-set-remote='echo git config branch.`git-branch-name`.remote "$1" && echo git config branch.`git-branch-name`.merge "refs/heads/$2"'
# Combining Lachie Cox's crazy Git branch mojo:
#   http://spiral.smartbomb.com.au/post/31418465
# with 
#   http://henrik.nyh.se/2008/12/git-dirty-prompt
# AND Geoff Grosenbach's style:
#   http://pastie.org/325104
# Sweeeeeeeet!
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "(☠)"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

if [ $system_name == 'Linux' ]; then
  [ -f /etc/bash_completion ] && . /etc/bash_completion
  export EDITOR='vim'
else
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
  # for cf in /usr/local/etc/bash_completion.d/*; do . $cf; done
  for cf in ~/.bash_completion.d/*; do . $cf; done  
  export EDITOR='vim'
fi

export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j4'
export RUBYLIB="lib:test:$RUBYLIB"
export GEMS="`gem env gemdir`/gems"
export HISTSIZE=1000000
export FIGNORE="CVS:.swp:.DS_Store:.svn"
export JAVA_HOME=/Library/Java/Home

export PATH=/opt/android-sdk-mac_x86/tools:/usr/local/mysql/bin:~/.gem/ruby/1.8/bin:~/Library/Haskell/bin:/opt/maven/bin:/usr/local/bin:/usr/local/sbin:~/bin:${PATH}

# old prompt
# export PS1='\[\033[01;32m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;34m\]$(parse_git_branch)"; fi) \$ \[\033[00m\]'
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "

#export http_proxy=http://username:password@host:port/
#export http_proxy=http://proxy.uq.net.au:80

# coloured ls
if [ "$TERM" != "dumb" ]; then

  if [ $system_name == 'Linux' ]; then
    color_option='--color=auto'
    alias du='du -k --max-depth=1'
  else
    color_option='-G'
    alias du='du -k -d1'
    alias top='top -o cpu'
    alias vi='vim'
  fi

  alias ls="ls $color_option"
  alias ll="ls -lh $color_option"
  alias la="ls -a $color_option"
  alias lal="ls -lha $color_option"

  . ~/.scripts/j.sh
  . ~/.scripts/goku.sh
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

#shopt -s globstar

bind "C-p":history-search-backward
bind "C-n":history-search-forwardp
bind "set show-all-if-ambiguous On"

. ~/.aliases/git
. ~/.aliases/svn
. ~/.aliases/commands
. ~/.aliases/oomph

[[ -s "/Users/tom/.rvm/scripts/rvm" ]] && source "/Users/tom/.rvm/scripts/rvm"
