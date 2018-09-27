#!/bin/bash

# Thanks to https://gist.github.com/willurd/5720255

set -e

case $1 in
    python2)
        python -m SimpleHTTPServer 8000
        ;;

    python3)
        python -m http.server 8000
        ;;

    ruby)
        ruby -run -ehttpd . -p8000
        ;;

    *)
        ruby -run -ehttpd . -p8000
        ;;
esac
