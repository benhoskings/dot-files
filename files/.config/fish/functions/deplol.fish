function deplol
	gitco deploy
	and git merge work
	and gitlcg -25
	and gitco work
	and gitlc origin/deploy..deploy
	and echo "Hit enter if that looks OK."
	and read
	and echo "Pushing..."
	and git push
	and cap deploy:all $argv


end
