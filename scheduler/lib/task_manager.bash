#!/bin/bash

source lib/resource_manager.bash

task_list () {
	ls tsk/*
}

task_add () {
	echo 2;
	# increment last_tid
	tid=$(cat dat/last_tid);
	let "tid++";
	echo $tid > dat/last_tid

	# create data structure
	mkdir tsk/$tid
	read -p "deadline: " dl;
	# add deadline
	echo $dl > tsk/deadline;
	# add steps
	mkdir -p tsk/stp
	local step=0;
	while read -p "new step: " new_step
	do
		if [ $new_step = 'n' ]
		then
			break;
		fi
		let "step++"
		add_resources $tid
	done
}

task_status () {
	# each task have a state of execution
	# created
	# stopped
	# started
	# running
	echo 1
}

task_remove () {
	read -p "task id: " tid
	# TODO: free resources
	rm -rf tsk/$tid
}



