function reload_webkit
	osascript -e 'tell application "WebKit" to do JavaScript "window.location.reload()" in front document'


end
