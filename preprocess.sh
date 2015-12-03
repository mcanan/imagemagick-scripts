#!/bin/bash
display_usage() { 
	echo -e "\nUsage:\n$0 source_files_dir output_dir\n" 
	echo -e "Example:\n$0 /tmp /tmp/output/ \n" 
} 

if [ $# -ne 3 ]; then 
	echo $#
	display_usage
	exit 1
fi 

SOURCE_FILES_DIR=$1
TARGET_DIR=$2
OPERATION=$3

mkdir -p $TARGET_DIR

for FILE in $SOURCE_FILES_DIR/*.JPG
do
	echo "Processing $FILE..."
	case $OPERATION in
		resize)
			mogrify -resize 1280x720^ -gravity center -crop 1280x720+0+0 +repage -write $TARGET_DIR/$(basename $FILE) $FILE
			;;
		normalize)
			convert $FILE -normalize -channel all $TARGET_DIR/$(basename $FILE)
			;;
		*)
			display_usage
	esac
done
