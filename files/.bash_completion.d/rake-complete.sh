_check_rakefile() {
  cache_complete Rakefile .cache_rake "rake -T | awk '/^rake / {print \$2}'"
}
complete -F _check_rakefile -o default rake
