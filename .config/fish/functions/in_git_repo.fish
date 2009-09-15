function in_git_repo
	set -l g (git rev-parse --git-dir ^/dev/null)
	[ -n "$g" ]
	and [ (pwd) != "~" ]
	and [ "$g" != "$HOME"/.git ]


end
