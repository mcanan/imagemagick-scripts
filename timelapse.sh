#!/bin/bash

display_usage() { 
	echo -e "\nUsage:\n$0 output_file.jpg\n" 
	echo -e "Example:\n$0 output.mp4\n" 
} 

if [ $# -ne 1 ]; then 
	display_usage
	exit 1
fi 

OUTPUT_FILE="$3"

/usr/local/bin/ffmpeg -i %*.jpg -c:v libx264 -pix_fmt yuv420p "$OUTPUT_FILE"

