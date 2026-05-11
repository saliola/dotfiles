#!/bin/bash

# Usage:
# 
# `datestamp report.txt` --> 2026-05-11 - report.txt

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename $0) <filename>"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found."
    exit 1
fi

date=$(date +%Y-%m-%d)
new_file="${date} - ${file}"

mv -i "$file" "$new_file"
echo "File '$file' moved to '$new_file'"
