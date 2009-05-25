function git_dirty_files_count
	if test -d .git
		git diff --stat | 		tail -n1 | 		sed -E 's/^ *//' | 		sed -E 's/ [a-z ]+\((.)(\),)?/\1/g' | 		sed -E 's/[a-z ]+, / (/' | 		sed -E "s/([0-9]+)\+/$pr_green\1$pr_grey+/g" | 		sed -E "s/([0-9]+)\-/$pr_red\1$pr_grey-/g"
	end


end
