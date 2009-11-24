function build_nginx --description Build\ nginx/Passenger,\ +SSL\ +upload_module.\ Example:\ install_nginx\ \'0.7.59\'\ \'2.0.9\'
	set nginx_version $argv[1]
	set upload_module_version $argv[2]
	cd ~/src
	test -f nginx-$nginx_version.tar.gz
	or wget http://sysoev.ru/nginx/nginx-$nginx_version.tar.gz
	test -f nginx_upload_module-$upload_module_version.tar.gz
	or wget http://www.grid.net.ru/nginx/download/nginx_upload_module-$upload_module_version.tar.gz
	test -d nginx-$nginx_version
	and rm -r nginx-$nginx_version
	test -d nginx_upload_module-$upload_module_version
	and rm -r nginx_upload_module-$upload_module_version
	tar -zxvf nginx-$nginx_version.tar.gz
	tar -zxvf nginx_upload_module-$upload_module_version.tar.gz

	echo -ne "\n2\n$PWD/nginx-$nginx_version\n\n--with-http_ssl_module --add-module='$PWD/nginx_upload_module-$upload_module_version'\n\n\n" | 	sudo passenger-install-nginx-module


end
