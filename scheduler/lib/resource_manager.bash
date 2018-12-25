#!/bin/bash

a


# add all resources for this step
add_resources () {
	tid=$1
	# time duration (if exists)
	# if the resource is lockable of not
	while read -p "new resource: " new_res
	do
		if [ $new_res = 'n' ]
		then
			break;
		fi
		add_resource $tid
	done
}

add_resource () {
	echo 1
}

list_free_resource () {
	cat dat/resource_list
}

lock_resource () {
	res=$1
	echo 1
}

free_resource () {
	echo 1
}
