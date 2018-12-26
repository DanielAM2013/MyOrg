get_option_from_file () {
	opt=$1
	file=$2
	echo $(cat $file | sed --silent s/$opt=//p)
}
