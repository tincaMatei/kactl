#!/bin/bash
# ./test-all.sh EXEC DIR runs the executable at EXEC for every test in
# DIR. All tests are of form *.in/*.ans, change at (EXT) the extensions.
EXEC=$1; DIR=$2; RED="\033[0;31m"; GREEN="\033[1;32m"; NC="\033[0m";
for i in $DIR/*.in ; do    # (EXT)
  IN=$i; OUT=${i%.in}.ans  # (EXT)
  start=$(date +%s.%N)
  ./$EXEC <$IN $>output.txt
  dur=$(echo "$(date +%s.%N) - $start" | bc)
  printf "Time: %.3f\n" $dur
  diff -wB output.txt $OUT >/dev/null 2>/dev/null
  if [ "$?" -ne "0" ] ; then
    printf "${RED}Wrong answer${NC}\n"
    printf "Input:\n$(cat $IN)\n\nExpected:\n$(cat $OUT)\nGot:\n$(cat output.txt)\n\n\n"
  else
    printf "${GREEN}Accepted${NC}\n"
  fi
done
