
setopt prompt_subst # Expand parameters, etc, in the prompt variables.

tilde_or_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/"
}

export PROMPT=$'%{\e[0;90m%}%n@\e[0;30;47m%M%{\e[0m%}
%{\e[0;%(?.32.31)m%}>%{\e[0m%} '
export RPROMPT=$'%{\e[0;90m%}$(tilde_or_pwd)$(git_cwd_info)%{\e[0m%}'
