function gitbrt
	for k in (git branch|perl -pe 's/^..//')
		echo -e (git show --pretty=format:"%ci (%cr) %Cblue%h%Creset %Cgreen%an%Creset" $k | head -n 1)\\t$k
	end | 	sort -r

end
