#!/bin/bash

if [[ $# == 1 ]] ;then
	dir_tmp=$1
else
	echo "usage: $0 {$dir_tmp}"
	exit 255
fi

for i in `ls -1 $dir_tmp`
do
	echo "===="
	cat $dir_tmp/$i | ./parse.pl 
	echo "===="
done

exit 0 
