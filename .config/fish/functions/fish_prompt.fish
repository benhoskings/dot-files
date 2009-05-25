function fish_prompt --description 'Write out the prompt'
	set pr_timestamp (date '+%a %H:%M:%S')
	set pr_user (whoami)
	set pr_host (hostname | cut -d . -f 1)
	set pr_cwd (prompt_pwd)
	set pr_git_info (git_cwd_info)
	echo -e "\033[90m$pr_timestamp\033[0m $pr_user\033[90m@\033[0m$pr_host \033[90m$pr_cwd$pr_git_info\033[0m \033[32m>\033[0m "


end
