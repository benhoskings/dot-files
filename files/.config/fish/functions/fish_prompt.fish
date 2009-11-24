function fish_prompt --description 'Write out the prompt'
	set pr_status (test $status = 0; and echo '\001\033[32m\002:)\001\033[0m\002'; or echo '\001\033[31m\002:|\001\033[0m\002')
	set pr_timestamp (date '+%a %H:%M:%S')
	set pr_user (whoami)
	set pr_host (hostname | cut -d . -f 1)
	set pr_term (test $TERM = 'screen'; and echo "[screen/$WINDOW] ")
	set pr_cwd (prompt_pwd)
	set pr_git_info (git_cwd_info)
	echo -e "$pr_status \001\033[90m\002$pr_timestamp\001\033[0m\002 $pr_user\001\033[90m\002@\001\033[0m\002$pr_host \001\033[90m\002$pr_term\001\033[0m\002$pr_cwd\001\033[90m\002$pr_git_info\001\033[0m\002 \001\033[32m\002>\001\033[0m\002 "


end
