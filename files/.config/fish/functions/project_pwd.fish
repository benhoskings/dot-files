function project_pwd
	pwd | perl -pe 's/~\/projects\/([^\/]+)\/current/$1 :/'
end
