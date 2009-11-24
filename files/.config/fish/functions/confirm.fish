function confirm
	echo "OK [y/N]?"
	read confirm_result
	test 'y' = $confirm_result


end
