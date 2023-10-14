# This script is used to match 
# each line of text in the file 
# This file is used for testing 
# and you can matches the.h and.c strings 
# in the txt file
REGEX="$2"
FILE="$1"

# default pattern
re=".*\.[ch]\","

Fun(){
	for line in `cat $1`
	do
		if [[ "$line" =~ $2 ]]; then
			echo "$line" 
		fi
	done
}

echo "$REGEX"
if [ -z "$REGEX" ]; then
	# echo "hello"
	REGEX="$re"
fi

Fun  "$FILE" "$REGEX"