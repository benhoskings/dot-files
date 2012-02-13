function git_parse_branch
	sh -c 'git branch --no-color 2> /dev/null' | 	sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'


end
