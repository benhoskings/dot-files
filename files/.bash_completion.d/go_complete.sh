#!/bin/bash
GO_SEARCH_DIRS="$HOME/Projects $HOME/src /opt"
export GO_SEARCH_DIRS

get_dir_list() {
  for DIR in $GO_SEARCH_DIRS; do
    ls -l --color=auto $DIR | grep ^d | awk '{print $9}'
  done
}

find_sub_dirs_strict() {
  MATCHING_DIR=`ls -l --color=auto $DIR | grep ^d | awk '{ print $9}' | grep "^$PATTERN" | head -n 1`
}

find_sub_dirs() {
  MATCHING_DIR=`ls -l --color=auto $DIR | grep ^d | awk '{ print $9}' | grep $PATTERN | head -n 1`
}

go () {
  PATTERN=$1
  for DIR in $GO_SEARCH_DIRS; do
    find_sub_dirs_strict
    [ -n "$MATCHING_DIR" ] && cd ${DIR}/${MATCHING_DIR} && return
  done

  for DIR in $GO_SEARCH_DIRS; do
    find_sub_dirs
    [ -n "$MATCHING_DIR" ] && cd ${DIR}/${MATCHING_DIR} && return
  done
}

_check_go_dirs() {
  cache_complete /bin/bash .cache_godir "get_dir_list"
}

complete -F _check_go_dirs -o default go
