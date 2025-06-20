#!/bin/bash

for month in 05 06
do
  if [ "$month" == "05" ]; then
    max_day=31
  else
    max_day=20
  fi

  for day in $(seq -w 1 $max_day)
  do
    for commit in {1..10}
    do
      export GIT_COMMITTER_DATE="2025-$month-$day 12:$commit:00"
      export GIT_AUTHOR_DATE="2025-$month-$day 12:$commit:00"
      echo "Commit $commit del día $day/$month/2025" >> archivo.txt
      git add archivo.txt
      git commit -m "Commit $commit del día $day/$month/2025"
    done
  done
done