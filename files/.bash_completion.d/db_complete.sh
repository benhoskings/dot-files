#!/bin/bash
DB_SEARCH_DIRS="$HOME/Projects $HOME/src /opt $HOME/src/vlc $HOME/Projects/vlc $HOME/p $HOME/src/bdk"
LS_COMMAND="ls -l" # or "ls -l --color=auto"

export GO_SEARCH_DIRS

# See https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
declare -A databases
databases=( ["move_20170606"]="psql -U sa -h move.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 move_20170606" \
            ["ams-prep"]="psql -U jetski_prep_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prep" \
            ["ams-snapshot"]="psql -U jetski_prod_user -h jetski-snapshot-jul15.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prod" \
          )
# echo 

get_db_list() {
    for i in "${!databases[@]}"; do
        echo $i
    done | tr "\n" ' '
}

db() {
    PATTERN=$1
    COMMAND=$2
    CONNECT_STR=${databases[$PATTERN]}
    if [[ -z "${CONNECT_STR}" ]]; then echo "Can't find database ${PATTERN}"; exit -1; fi
    if [[ "$COMMAND" == "connect" ]]; then
        `${CONNECT_STR}`
    else
        echo ${COMMAND}
        echo ${CONNECT_STR}
    fi
}

_check_db_dirs() {
    cache_complete /bin/bash .cache_dbdir "get_db_list"
}

complete -F _check_db_dirs -o default db
