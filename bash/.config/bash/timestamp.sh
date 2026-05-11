#!/bin/bash

# Check if a filename was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename $0) <filename>"
    exit 1
fi

# Get the filename from the command line
file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found."
    exit 1
fi

# Extract filename and extension
filename="${file%.*}"
extension="${file##*.}"

# Construct the new filename by appending the date to the current filename
datetime=$(date +%Y-%m-%d_%H-%M-%S)
if [ "$filename" == "$file" ]; then
    # the case where the filename has no extension
    new_file="${filename}-${datetime}"
else
    new_file="${filename}-${datetime}.${extension}"
fi

# Rename the file
cp -i "$file" "$new_file"
echo "File '$file' copied to '$new_file'"
