# This shell script is used to recursively 
# traverse all files in a folder, 
# performing an operation on each file
DIR="$1"
if [ -z "$2" ]; then
	COM=echo
else
	COM="$2"
fi

#  Subfunction entry, with parameter filepath
subCommd(){
	# echo "filepath: $1"
	# echo "command: $2"
	COM="$2 $1"
	$COM
}
commdE(){
	echo "error $1"
}
COUNT=1
fun(){
	local CURPATH="$1"
	for FILE in `ls -a  $CURPATH` ;
	do
		local FILES="$FILE"
		if [ -d "$CURPATH/$FILES" ]; then
			if [ "$FILES" = "." ]; then
				echo "if dir is . or .., skipping"
			elif [ "$FILES" = ".." ]; then
				echo "if dir is . or .., skipping"
			else
				fun "$CURPATH/$FILES"
			fi
		else
			subCommd "$CURPATH/$FILES" "$COM"
		fi
		let COUNT+=1
		echo "===========$COUNT============"
	done
	subCommd "$CURPATH" "$COM"
}
echo "=====start====="

if [ -d "$DIR" ]; then
	if [ "$DIR" = "." ]; then
		echo "if dir is . or .., skipping"	
	elif [ "$DIR" = ".." ]; then 
		echo "if dir is . or .., skipping"
	else
		fun "$DIR"
	fi
else
	subCommd "$CURPATH/$FILE" "$COM"
fi
echo "======end======"

# fun "$DIR"