function git_cwd_info
	if test -d .git
		printf -- " - %s, " (git_parse_branch)
		if test (git ls-files -m | wc -l) -eq 0
			echo 'clean'
		else
			printf "%s" (git_dirty_files_count)
		end
	end



end
