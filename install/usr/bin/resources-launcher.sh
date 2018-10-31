#/bin/bash
#Shell that sets the insecure mode for flash and java before launching an educational resource

help ()
{
	echo "Usage:"
	echo "$0 path_to_desktop"
	exit 1
}

[ $# -eq 0 ] && help

if which flash-java-insecure-perms
then
	if [ -s $1 ]
	then
		flash-java-insecure-perms install
		xdg-open $1
	else
		msg="File $1 not found"
		echo $msg
		notify-send -u normal  "$msg" -i error
	fi
else
	msg="You must install the flash-java-insecure-perms package"
	echo $msg
	notify-send -u normal  "$msg" -i error
	exit 1
fi

exit 0
