#!/bin/bash

rosconfig () {

	local rosbase=/opt/ros
	cd $rosbase;
	local rosdistros=(*);
	local rosversions=("lunar" "kinetic")

	local roscurrent="";
	for j in ${rosversions[@]}
	do
		for i in ${rosdistros[@]}
		do
			if [ "$i" = "$j" ]
			then
				roscurrent="${rosdistros[$j]}"
				break;
			fi
		done
	done

	#catkin_dirs={"catkin_ws","myros"}
	catkin_dirs="myros"
	#ros_dirs="{$HOME/$catkin_dirs/devel,$rosbase/$roscurrent}/setup.bash"
	echo "$catkin_dirs"
	cd -
	#shift
	#eval "source $ros_dirs"
	eval "source $HOME/$catkin_dirs/devel/setup.bash"
}

rosip (){
	case "$1" in
		local)
			export ROS_IP=127.0.0.1;
			export ROS_MASTER_URI=http://$ROS_IP:11311;
			;;
		global)
			export ROS_IP=192.168.1.4;
			export ROS_MASTER_URI=http://$ROS_IP:11311;
			;;
		r2d2)
			export ROS_IP=192.168.1.4
			export ROS_MASTER_URI=http://192.168.1.2:11311
			;;
	esac
}
