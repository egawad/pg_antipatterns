#!/bin/sh

# 
# argument;
#   num: a number you want to INSERT INTO a table
#

# check the number of arguments
if [ $# -ne 1 ]; then
  echo "the number of arguments is $#." 1>&2
  echo "You need 1 argument" 1>&2
  exit 1
fi

num=${1}
insert_date=`date`

for i in `seq 1 ${num}`
do
  psql -d anti-pattern -U postgres -c "INSERT INTO comments(comment) VALUES('Comment ${i} at ${insert_date}')"
done

