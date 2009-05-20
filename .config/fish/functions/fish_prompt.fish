function fish_prompt --description 'Write out the prompt'
	printf "%s %s@%s %s%s > " (date '+%a %H:%M:%S') (whoami) (hostname|cut -d . -f 1) (prompt_pwd) (git_cwd_info)


end
