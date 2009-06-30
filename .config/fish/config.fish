
cd ^/dev/null

set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin

set git_concise_log_format '--pretty=format:%Cblue%h%Creset %cr %Cgreen%an%Creset %s'

if test (uname -s) = "Darwin"
  set PATH /opt/local/lib/postgresql83/bin /opt/local/bin $PATH

  function vi
    mate $argv
  end

  function sed
    gsed $argv
  end
end
