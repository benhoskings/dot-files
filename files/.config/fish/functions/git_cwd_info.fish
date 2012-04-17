function git_cwd_info
	if in_git_repo
		echo -e " "(git_parse_branch)"\001\033[0m\002@\033[90m"(git_head_commit_id)
		if not test (git ls-files -m | wc -l) -eq 0
			echo "+"
		end
	end


end
