#!/bin/bash
display_usage() { 
cat <<EOF

Usage: 
$0 source_files_dir target_dir operation

Example:
$0 \tmp\input \tmp\output normalize

EOF
} 

if [ $# -ne 3 ]; then 
	display_usage
	exit 1
fi 

SOURCE_FILES_DIR=$1
TARGET_DIR=$2
OPERATION=$3

mkdir -p $TARGET_DIR

for FILE in $SOURCE_FILES_DIR/*.{jpg,JPG,png,PNG,jpeg,JPEG}
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
