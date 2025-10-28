#!/bin/bash
# ./test-all.sh EXEC DIR runs the executable at EXEC for every test in
# DIR. All tests are of form *.in/*.ans, change at (EXT) the extensions.
EXEC=$1; DIR=$2;
for IN in $DIR/*.in ; do
  OUT=${IN%.in}.ans
  ./$EXEC <$IN >output.txt
  diff -wB output.txt $OUT >/dev/null 2>/dev/null
  if [ "$?" -ne "0" ] ; then
    printf "Wrong answer!\n"
    printf "Input:\n$(cat $IN)\n\n"
    printf "Expected:\n$(cat $OUT)\n"
    printf "Got:\n$(cat output.txt)\n\n\n"
  else
    printf "Accepted\n"
  fi
done
