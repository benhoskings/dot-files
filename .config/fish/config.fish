
cd ^/dev/null

set PATH /opt/local/lib/postgresql83/bin /opt/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin

if test (uname -s) = "Darwin"
  function sed
    gsed $argv
  end
end
