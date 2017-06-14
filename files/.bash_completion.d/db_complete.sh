#!/bin/bash
DB_SEARCH_DIRS="$HOME/Projects $HOME/src /opt $HOME/src/vlc $HOME/Projects/vlc $HOME/p $HOME/src/bdk"
LS_COMMAND="ls -l" # or "ls -l --color=auto"

export GO_SEARCH_DIRS

get_db_list() {
    echo "move_20170606"
}

db() {
    PATTERN=$1
    case $PATTERN in
        move_20170606)
            psql -U sa -h move.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 move_20170606
            ;;
    esac
}

_check_db_dirs() {
    cache_complete /bin/bash .cache_dbdir "get_db_list"
}

complete -F _check_db_dirs -o default db
