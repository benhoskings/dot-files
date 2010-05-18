setopt prompt_subst

project_pwd() {
  pwd | perl -pe "s/\/Users\/${USER}\/projects\/([^\/]+)\/current/\$1 :/"
}

in_git_repo() {
  g=`git rev-parse --git-dir 2>/dev/null`
	[ -n "$g" ] &&
	[ `pwd` != "~" ] &&
	[ "$g" != "$HOME"/.git ]
}

git_parse_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_head_commit_id() {
  git rev-parse --short HEAD
}

git_cwd_info() {
  if in_git_repo; then
    echo -ne " %{\e[0;90m%}`git_parse_branch`%{\e[0m%}@\033%{\e[0;90m%}`git_head_commit_id`"
    [[ `git ls-files -m | wc -l` -eq 0 ]] || echo " +"
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
