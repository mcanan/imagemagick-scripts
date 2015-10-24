#!/bin/bash

display_usage() { 
	echo -e "\nUsage:\n$0 source_files_dir output_file.jpg\n" 
	echo -e "Example:\n$0 \\\tmp \\\tmp\\\stars_trail.jpg\n" 
} 

if [ $# -ne 1 ]; then 
	display_usage
	exit 1
fi 

OUTPUT_FILE="$3"

/usr/local/bin/ffmpeg -i %*.JPG -c:v libx264 -pix_fmt yuv420p "$OUTPUT_FILE"

