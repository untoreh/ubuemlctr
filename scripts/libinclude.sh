#!/bin/bash
include=( "/usr/bin/post*" \
          "/bin/ps" \
          )

for n in ${!include[*]}
do
find ${include[n]} | xargs -I {} ldd {} | awk '{print $3}' | grep '/' | sort -u | xargs -I {} touch {}
sleep 2
echo "$n"
done