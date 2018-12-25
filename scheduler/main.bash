#!/bin/bash

echo "Scheduler"

source lib/scheduler.bash
source dat/variables

cmd="";

var="opt[@]";
while :
do
	idx=0;
	for i in ${!var}
	do
		echo "$idx) $i";
		let "idx++";
	done
	var=(${!var});
	if [ ${#var} -eq 0 ]
	then
		cmd=${cmd/++/_}; cmd=${cmd//+/}
		eval $cmd $tid
		break
	else
		read -p "choose: " c;
		c=${var[$c]}
		cmd=$cmd"+"$c"+";
		var="$c[@]";
	fi
done
