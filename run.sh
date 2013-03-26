#!/bin/bash

if [[ $# == 2 ]] ; then
	fn_url=$1
	dir_output=$2
else
	echo "usage:$0 {fn_url} {dir_output}"
	exit 255
fi

./search.pl $fn_url $dir_output
./parse-all.sh $dir_output/tmp > $dir_output/list
./down.pl $dir_output/list $dir_output

exit 0 
