function gitlpend
	printf "commits from %s%s/%s%s to %sHEAD%s" (set_color red) (git config branch.(git_parse_branch).remote) (git_parse_branch) (set_color normal) (set_color red) (set_color normal)
	echo
	git --no-pager log --graph (git config branch.(git_parse_branch).remote)/(git_parse_branch)..HEAD $git_concise_log_format
	echo


end
