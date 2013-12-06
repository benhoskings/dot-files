cache_complete() {
  local src_file="$1"
  local cache_file="$2"
  local generate_cmd="$3"
  local word=${COMP_WORDS[COMP_CWORD]}

  if [ ! -e "$src_file" ]; then
    return
  fi

  # if the cache file doesn't exists
  # or the src_file is more recent than the cache_file
  if [ ! -f "$cache_file" -o "$src_file" -nt "$cache_file" ]; then
    t1=$(date +%s)
    eval $generate_cmd > $cache_file
    t2=$(date +%s)
  fi

  COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
  local tasks=$(cat $cache_file)
  if [ $(($t2 - $t1)) -lt 2 ]; then
    rm $cache_file
  fi
  COMPREPLY=( $(compgen -W "${tasks}" -- "$word") )
}
