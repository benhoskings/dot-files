setopt prompt_subst

project_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER\/projects\/\([^\/]*\)\/current/\\1 :/"
}

in_git_repo() {
 [ $PWD != "/Users/$HOME" ] && [ -d '.git' ]
}

git_parse_branch() {
  sed -e 's/^.*refs\/heads\///' '.git/HEAD'
}

git_head_commit_id() {
  cut -c 1-7 ".git/refs/heads/`git_parse_branch`"
}

git_cwd_dirty() {
  [[ `git ls-files -m` == '' ]] || echo ' +'
}

git_cwd_info() {
  if in_git_repo; then
    echo -n "%{\e[0;90m%}`git_parse_branch`%{\e[0m%}@%{\e[0;90m%}`git_head_commit_id``git_cwd_dirty`%{\e[0m%}"
  fi
}

export PROMPT=$'`project_pwd``git_cwd_info`\n%{\e[0;%(?.32.31)m%}⚡%{\e[0m%} '

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extendedglob notify
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
