#!/bin/bash

display_usage() { 
cat <<EOF

Usage: 
$0 source_files_dir output_file.jpg

Example:
$0 /tmp/input output.mp4

EOF
}

if [ $# -ne 2 ]; then 
	display_usage
	exit 1
fi 

SOURCE_FILES_DIR=$1
OUTPUT_FILE="$2"

(cd "SOURCE_FILES_DIR" && /usr/local/bin/ffmpeg -i %*.jpg -c:v libx264 -pix_fmt yuv420p "$OUTPUT_FILE")

