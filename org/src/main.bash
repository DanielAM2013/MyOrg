#!/bin/bash

# worklog
# task list
# the tasks will be added to tasklist, after done the tasks will be moved to
# worklod, the current task need be seted by user and the new tasks need be add
# by user and allocated by scheduler using priority algorithm
#

# some tasks don't have deadline or priority just resources dependence

# define task data type

num_tasks=$(cat data/tasklist | wc -l)

get_current_timestamp () {
	echo -n $(date +%s);
}

priority_alg () {
	sort -nk 3 data/tasklist_bare -o data/tasklist
	sed -i 's/\(.*\)/\1 none/' data/tasklist
}

read_tasks () {
	# show tasks sorted by priority
	cat data/tasklist;
}

add_task () {
	local name time time2;
	read -p "Task name: " name;
	read -p "Start time: " time;
	read -p "End time: " time2;
	time=$(date +%s -d "+$time");
	time2=$(date +%s -d "+$time2");
	local num=$(cat data/tasklist_bare | wc -l);
	echo "$num $time $time2 \"$name\"" > data/tasklist_bare;
}

change_task_status () {
	# $1 = task_id
	# $2 = new status
	if [ "$2" = "done" ]
	then
		sed -n "s/^\($1.*\s\)\([a-z]*\)$/\1$2/p" data/tasklist >> data/worklog;
		sed -i "/^\($1.*\s\)\([a-z]*\)$/d" data/tasklist;
	else
		sed -i "s/^\($1.*\s\)\([a-z]*\)$/\1$2/g" data/tasklist;
	fi
}

#priority_alg;
#add_task;
change_task_status 0 done;
