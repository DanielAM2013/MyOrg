
# add all resources for this step
add_resources () {
	tid=$1
	# time duration (if exists)
	# if the resource is lockable of not
	while read -p "new resource? " new_res
	do
		if [ $new_res = 'n' ]
		then
			break;
		fi
		add_resource_to_task $tid
	done
}

add_resource_to_task () {
	tid=$1
	read -p "name: " name
	if [ ! -d res/$name ]
	then
		echo create resource
		resource_add $name
	fi
}

resource_add () {
	name=$1
	mkdir -p res/$name;
	read -p "how much: " hw
	read -p "deadline: " deadline
	read -p "lockable? " lock
	{
		echo hw=$hw
		echo deadline=$deadline
		echo lockable=$lock
	} > res/$name/info
}

list_free_resource () {
	cat dat/resource_list
}

resource_alloc () {
	# if the resource is lockable lock it
	# else just sign a quantity for the task or inform that task use this
	# resource
	echo $1 > res/$name/lock
}


lock_resource () {
	res=$1
	echo 1
}

free_resource () {
	echo 1
}

alloc_resource () {
	lock=$(get_option_from_file lockable res/$name/info)
	if [ $lock = 'y' ]
	then
		echo $tid > res/$name/status
	else
		hw=$(get_option_from_file hm res/$name/info)
		if [  $hm -eq 0 ]
		then
			echo "Inallocable"
		fi
	fi
}
