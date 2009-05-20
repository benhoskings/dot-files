function git_dirty_files_count
	if test -d .git
		git diff --stat | 		tail -n1 | 		sed -E 's/^ *//' | 		sed -E 's/ [a-z ]+\((.)(\),)?/\1/g' | 		sed -E 's/[a-z ]+, / dirty (/'
	end


end
