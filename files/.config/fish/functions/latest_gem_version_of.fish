function latest_gem_version_of
	gem list --local $argv[1] | 	grep "^$argv[1]" | 	sed -E 's/^.*\(([0-9.]+),.*/\1/'


end
