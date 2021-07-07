#!/bin/bash

DB_SEARCH_DIRS="$HOME/Projects $HOME/src /opt $HOME/src/vlc $HOME/Projects/vlc $HOME/p $HOME/src/bdk"

# See https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash

setup_database_list() {
    declare -Ag databases
    databases["orma"]="psql -U orma -h 118.68.168.241 -p 5432 orma"
    databases["move_zov"]="psql -U zov -h move.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 zov"
    databases["move"]="psql -U sa -h move.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 move"
    databases["ams-sa"]="psql -U awsroot -h jetski.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 postgres"
    databases["ams-prod"]="psql -U jetski_prod_user -h jetski.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 jetski_prod"
    databases["ams-uat"]="psql -U jetski_uat_user -h jetski-prep.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 jetski_uat"
    databases["ams-prep"]="psql -U jetski_prep_user -h jetski-prep.cq3ctoubdswc.ap-southeast-2.rds.amazonaws.com -p 5432 jetski_prep"
    # databases["ams-cd"]="psql -U jetski_cd_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_cd"
    # databases["ams-snapshot"]="psql -U jetski_prod_user -h jetski-snapshot-jul15.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prod"
    databases["gtfs"]="psql -U gtfs -h gtfs.c2kzxi2yumcx.us-east-1.rds.amazonaws.com -p 5432 realtime"
    databases["gtfs-nsw"]="psql -U gtfs -h gtfs.c2kzxi2yumcx.us-east-1.rds.amazonaws.com -p 5432 realtime-nsw"
    databases["gtfs-seq"]="psql -U gtfs -h gtfs.c2kzxi2yumcx.us-east-1.rds.amazonaws.com -p 5432 realtime-seq"
    databases["zmrlogger-snapshot"]="psql -U jamiecook -h zmrlogger.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 zmrlogger"
    databases["zapi-dev"]="psql -U sa -h zapi-dev.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 zapi_dev"
    databases["tmr-rfmd-pg"]="psql -U vlc -h database-1.cemxnagrnubh.ap-southeast-2.rds.amazonaws.com -p 5432 postgres"
    databases["tmr-rfmd"]="psql -U vlc -h database-1.cemxnagrnubh.ap-southeast-2.rds.amazonaws.com -p 5432 tmr_regional_model_dev"
    databases["planwisely-dev"]="psql -h localhost -U sa development"
    databases["planwisely-mapdata-dev"]="psql -h localhost -U sa mapdata_development"
    databases["planwisely-uat"]="psql -h sitewisely-uat.csw0jljqrfdu.ap-southeast-2.rds.amazonaws.com -U sa uat"
    databases["planwisely-mapdata-uat"]="psql -h sitewisely-uat.csw0jljqrfdu.ap-southeast-2.rds.amazonaws.com -U sa mapdata_uat"
}

get_db_list() {
    setup_database_list
    echo ${!databases[@]}
}

db() {
    local PATTERN=$1
    local COMMAND=$2

    setup_database_list
    CONNECT_STR=${databases[$PATTERN]}
    if [[ -z "${CONNECT_STR}" ]]; then
        echo "Can't find database ${PATTERN}";
        # exit -1
    else
        if [[ "$COMMAND" == "connect" ]]; then
            # Actually execute the connection string to get a psql shell
            $CONNECT_STR
        elif [[ "${COMMAND}" == "-f" ]]; then
            # Run the given file against the given connection
            local filename=$3
            if [[ -f ${filename} ]]; then
                $CONNECT_STR -f "$filename"
            else
                echo "No such file ${filename}"
                exit -1
            fi
        elif [[ "${COMMAND}" == "-c" ]]; then
            $CONNECT_STR -c "$3"
        else
            echo ${COMMAND}
            echo ${CONNECT_STR}
        fi
    fi
}

_check_db_dirs() {
    cache_complete /bin/bash .cache_dbdir "get_db_list"
}

complete -F _check_db_dirs -o default db
