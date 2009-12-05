function in_git_repo
	set -l g (git rev-parse --git-dir 2>/dev/null)
	[ -n "$g" ]
	and [ (pwd) != "~" ]
	and [ "$g" != "$HOME"/.git ]


end
