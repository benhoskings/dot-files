# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# Search your history
bind "\C-p":history-search-backward
bind "\C-n":history-search-forward

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias vi='vim'
alias open='gnome-open'
alias kah='cd ~/Projects/kahuna'
alias k='cd ~/Projects/kahuna'
alias san='cd ~/Projects/sandbox'
alias b="./build.sh"
alias ci="svn ci -m ''"
alias up="svn up"
alias st="svn st"
alias f="ssh freeman.vlc"
alias w="ssh warne.vlc"
alias g="ssh gordon.vlc"
alias coverage='k && (b coverage || rm -rf ~/build_coverage) && mv build/coverage ~/build_coverage && open ~/build_coverage/index.html'
alias min='ruby -e "p ARGF.select{|e| e =~ /^[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.min"'
alias max='ruby -e "p ARGF.select{|e| e =~ /^[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.max"'
alias sum='ruby -e "p ARGF.select{|e| e =~ /^[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.inject(0.0) {|a,x| a+=x}"'

alias df='df -h'
alias du='du -sh'
alias less='less -R'

alias screen='byobu'


function @ {
   pushd . 
   cd ~/Projects/kahuna
   ./@
   popd
}

function @_3 {
  pushd .
  cd ~/Projects/kahuna
  svn up
  cd ~/Projects
  rsync -ral kahuna .tmp/
  cd .tmp/kahuna
  ./build.sh && svn ci -m ''
  cd ~/Projects
  rsync -ral .tmp/kahuna/ kahuna/
  popd
}
