# Handy aliases to allow quick editing of key config files
alias ea="vim ~/.dot-files/files/.aliases/commands.sh && source ~/.dot-files/files/.aliases/commands.sh"
alias eb="vim ~/.dot-files/files/.bashrc && source ~/.dot-files/files/.bashrc"
alias ev="vim ~/.vim/vimrc ~/.vim/*.vim"
alias ed="vim ~/.dot-files/files && source ~/.bashrc"
alias ep="vim ~/.dot-files/files/.bash_prompt && source ~/.bash_prompt"
alias ec="vim ~/.dot-files/files/.aliases/colours.sh && source ~/.dot-files/files/.bashrc"

alias ..="cd .."
alias cp="cp -i"
[ `which ack` ] || alias ack='ack-grep'

alias crontab="VIM_CRONTAB=true EDITOR=vim crontab"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    # dircolors doesn't exist on mac osx
    if [ `which dircolors` ]; then eval "`dircolors -b`"; fi
    if [ `uname -s` == 'Linux' ]; then
        alias ls='ls --color=auto'
    elif [ `uname -s` == 'Darwin' ]; then
        if [ `which gls` ]; then
          # Use the core-utils version from homebrew if it's available...
          alias ls='gls --color=always'
        else
          # otherwise try to make bsd ls more usable by using linux style colouring
          export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
          alias ls='ls -G'
        fi
    fi

    alias ll='ls -l'
    alias l='ls -CF'

    export GREP_OPTIONS='--color=auto'
fi

if [ -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]; then
  alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
fi

alias vi='vim'

alias b="./build.sh"
alias sci="svn ci"
alias sup="svn up"
alias sst="svn st"
alias ss="svn st"
alias sd="svn diff | less"


RUBY_NUMERIC_ARRAY_STR='ruby -e "load \"~/.dot-files/stats.rb\"; p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map { |e| e.to_f }'
alias min='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.min"'
alias max='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.max"'
alias sum='ruby -e "p ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }.inject(0.0) {|a,x| a+=x}"'
alias mean='ruby -e "tmp = ARGF.select{|e| e =~ /^\s*[+-]?\d+[.]?\d*/ }.map{|e| e.to_f }; p tmp.inject(0.0) {|a,x| a+=x} / tmp.size"'
alias var="${RUBY_NUMERIC_ARRAY_STR}.sum\""

export LESS="-R"

alias screen='byobu'

source_if_exists()
{
  test -f $1 && source $1
}

source_directory()
{
  test -d $1 && for file in ${1}/*; do
    source $file
  done
}
