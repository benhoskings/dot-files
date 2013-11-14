[ -f ~/.bashrc ] && . ~/.bashrc

# MacPorts Installer addition on 2012-02-03_at_17:59:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Invoke byobu if it is installed AND we're in an interactive shell 
if [ -f "`which byobu-launcher`" ]; then
  # case "$-" in *i*) byobu-launcher && exit 0; esac;
  case "$-" in *i*) byobu-launcher; esac;
fi
