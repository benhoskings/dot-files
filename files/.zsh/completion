# Complete within words, not just at either end.
setopt complete_in_word

# Complete from left or right, case-insensitively
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Per-app completions
fpath=(~/.zsh/completion.d $fpath)
autoload -Uz compinit
compinit -u
