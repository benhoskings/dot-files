
cd ^/dev/null

set git_concise_log_format '--pretty=format:%Cblue%h%Creset %cr %Cgreen%an%Creset %s'

if test (uname -s) = "Darwin"
  set -x PATH /usr/X11/bin /opt/local/lib/postgresql83/bin /opt/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin
  set -x MANPATH /opt/local/man /usr/X11/man /usr/local/share/man /usr/share/man

  function vi
    mate $argv
  end

  function sed
    gsed $argv
  end
end
