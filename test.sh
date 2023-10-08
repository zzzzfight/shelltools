fun(){
	for F in `ls -a $1`
	do
		if [ "$F" = "." ]; then
			echo "$F"
		elif [ "$F" = ".." ]; then
			echo "$F"
		else
			echo "$F"
		fi
	done
}

fun "$1"