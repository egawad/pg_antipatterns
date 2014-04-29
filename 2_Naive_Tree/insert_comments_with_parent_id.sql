#!/bin/sh

# 
# argument;
#   $1 depth: a number of nested data
#   $2 parent_id: parent_id of nested data
#

# check the number of arguments
if [ $# -ne 2 ]; then
  echo "the number of arguments is $#." 1>&2
  echo "You need 2 arguments" 1>&2
  exit 1
fi

depth=${1}
parent_id=${2}
insert_date=`date`

for i in `seq 1 ${depth}`
do
  psql -d anti-pattern -U postgres -c "INSERT INTO comments(parent_id, comment) VALUES(${parent_id},'Nested Level ${i} at ${insert_date}')"
  parent_id=`psql -d anti-pattern -U postgres -t -c "SELECT last_value FROM comments_comment_id_seq;"`
done

