function in_git_repo
	set -l g (git rev-parse --git-dir ^/dev/null)
	if [ -n "$g" ]
		# we are in git repo
	end


end
