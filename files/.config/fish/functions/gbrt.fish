function gbrt
	for k in (git branch $argv|perl -pe 's/^..//')
		echo -en (git show --pretty=format:"%ci %Cblue%h%Creset %cr\t%Cgreen$k%Creset " $k -- | head -n 1)
		set -l message (git show --pretty=format:"%s" $k -- | head -n 1)
		if test "$message" = "Temp"
			echo -e "\001\033[31m\002$message\001\033[0m\002"
		else
			echo -e "\001\033[90m\002$message\001\033[0m\002"
		end
	end | 	sort -r


end
