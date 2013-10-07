# Shell history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=900000 # This value is smaller than HISTSIZE to allow a window for dupes.
setopt append_history # Append to the history file rather than replacing it.
setopt inc_append_history # Write history items as they are run, not on shell exit.
setopt hist_expire_dups_first # Expire duplicate history items before older unique ones.
setopt hist_ignore_dups # Don't save consecutive duplicate history items.

# Misc zsh config
setopt notify # Print background job status immediately.
unsetopt auto_cd # Don't "execute" directories by changing into them.

# Move between (customised) words with option-left/right.
export WORDCHARS='*?[]~=&;!#$%^(){}'
bindkey "\e\e[C"  forward-word
bindkey "\e\e[D"  backward-word
