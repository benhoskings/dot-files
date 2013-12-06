#!/bin/bash

_check_capfile() {
  cache_complete capfile .cache_cap "cap -T | awk '/^cap / {print \$2}'"
}
complete -F _check_capfile -o default cap
