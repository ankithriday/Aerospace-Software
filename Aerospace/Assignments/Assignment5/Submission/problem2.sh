#!/bin/bash
# Ankit Hriday
# Problem-2

echo "Problem-2 Assignment-5"

echo "Input is $1"

FileName=$1

a=$(ls -l $FileName);
# b=$(head -c 4 $a);
type=${a:0:1}
if [ $type = "-" ]; then
   echo "The File Type is not defined.i.e. The file type is $type."
   else
       echo "The File Type is $type"
   fi
perm=${a:1:3}
echo The permissions for the Owner are $perm





