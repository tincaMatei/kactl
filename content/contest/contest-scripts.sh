#!/bin/bash
# Useful scripts to make helix work. All go in HOME
# strip.sh - strip of extension
filename=$1 # remove last command for uppercase
echo "$filename" | cut -f 1 -d '.' | tr '[:upper:]' '[:lower:]'

# csan.sh
base=$($HOME/strip.sh $1)
g++ -Wall -Wconversion -Wfatal-errors -g -std=c++20 \
  -fsanitize=undefined,address -o $base $1

# test.sh
base=$($HOME/strip.sh $1)
$HOME/test-all.sh $base samples/$base
 
# hash.sh - compute hash of piped input
cpp -dD -P -fpreprocessed | tr -d '[:space:]' | md5sum | cut -c-6

# .bashrc
alias c="$HOME/csan.sh"
