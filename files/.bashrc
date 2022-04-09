#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Homebrew stuff (for Mac OS/X) - this has to be before the aliases so that we can do things like [ `which ack` ] in there
[ -d ~/.homebrew/bin ] && PATH=~/.homebrew/bin:$PATH

# added by Anaconda3 5.2.0 installer
[[ -d /anaconda3/bin ]] && export PATH="/anaconda3/bin:$PATH"

# Alias definitions.
source ~/.aliases/commands.sh
source_directory ~/.aliases
source_if_exists ~/.bash_aliases

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
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

if [ `uname -s` == 'Linux' ]; then
    source_if_exists ./etc/bash_completion
else # I guess this is Mac OS/X
    source_if_exists /opt/local/etc/bash_completion
fi
source_directory ~/.bash_completion.d
source_if_exists ~/.bash_prompt

# Amazon EC2 stuff
for i in ~/.ec2rc ~/Projects/kahuna/etc/ec2/ec2rc; do source_if_exists $i; done

# Oracle stuff
if [ -d /opt/oracle/instantclient_10_2 ]; then
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/oracle/instantclient_10_2
    ORACLE_HOME=/opt/oracle/instantclient_10_2
fi

# Ruby Stuff -----------------------------------------------------------
which brew
if [[ $? == 0 ]]; then
    source_if_exists $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
    source_if_exists $(brew --prefix)/opt/chruby/share/chruby/auto.sh
fi
# END: Ruby Stuff ------------------------------------------------------

# NVM Stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# PyEnv Stuff
[[ -d ~/.pyenv ]] && export PATH=$PATH:~/.pyenv/bin
command -v pyenv && eval "$(pyenv init -)"
[[ -d ~/.pyenv/shims ]] && export PATH=$PATH:~/.pyenv/shims
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi

# Python Stuff
brew_python_bin_dir="/usr/local/opt/python/libexec/bin"
[[ -d ${brew_python_bin_dir} ]] && export PATH="$PATH:${brew_python_bin_dir}"

# Haskell binaries on the path please
[ -d ~/Library/Haskell/bin ] && PATH=$PATH:~/Library/Haskell/bin
[ -d ~/.local/bin ] && PATH=$PATH:~/.local/bin

# Export all the things we've set up above
export JAVA_HOME=/opt/jdk17
export EDITOR=vim
export FIGNORE="CVS:.swp:.svn"
export PATH=$PATH:~/bin:$JAVA_HOME/bin
export LD_LIBRARY_PATH
export LANG=en_AU.UTF-8 # Setup the LANG so that gcc doesn't spit a^ characters instead of '
export ORACLE_HOME
export CIRCLE_API_TOKEN=f9c0f57d80044e8776a53f124a60bf0809cf8fe1
export BAT_THEME=OneHalfLight
export PACKAGE_ACCESS_TOKEN=8WyjTqkDa4uj3-rfiomm

# Allow gistit to post gists as jamiecook
export GISTIT_TOKEN="5522c05955ac0cbf22c8c73c26b7c51fdc4783a2"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -d $HOME/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

# s3fzf config
export S3FZF_BUCKET=move2.0
export S3FZF_ROOTDIR=/Users/jamie/move2.0
