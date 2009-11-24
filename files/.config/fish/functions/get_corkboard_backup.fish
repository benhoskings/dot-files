function get_corkboard_backup
	scp backups@slice.corkboard.cc:(ssh backups@slice.corkboard.cc 'ls -1t ~/sqldumps/ec2.corkboard.cc/*tgz | head -n1') ~/backups/sqldumps/


end
