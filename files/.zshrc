setopt prompt_subst

. ~/.zsh/prompt
. ~/.zsh/aliases
. ~/.zsh/git_aliases

export EDITOR='mate -w'
export PATH="$HOME/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin"
export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extendedglob notify
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export WORDCHARS='*?_[]~=&;!#$%^(){}'

bindkey '[D' emacs-backward-word
bindkey '[C' emacs-forward-word
