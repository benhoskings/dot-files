function release_hammock
	set VERSION (cat lib/hammock.rb | grep "VERSION =" | sed -E 's/^.*\'([0-9.]+)\'.*$/\1/')
	and rake gemspec
	and gitd
	and confirm
	and gitc -a -m "Bumped version to $VERSION."
	and git tag v$VERSION
	and gitlpend
	and confirm
	and echo "Pushing..."
	and git push
	and git push --tags
	and rake release VERSION=$VERSION


end
