#!/bin/bash

# Usage:
#
# `datestamp report.txt`    --> 2026-05-11 - report.txt
# `datestamp -c report.txt` --> 2026-05-11-report.txt

COMPACT=false

while getopts "c" opt; do
    case $opt in
        c) COMPACT=true ;;
        *) echo "Usage: $(basename $0) [-c] <filename>"; exit 1 ;;
    esac
done
shift $((OPTIND - 1))

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename $0) [-c] <filename>"
    exit 1
fi

file="$1"

if [ ! -e "$file" ]; then
    echo "Error: '$file' not found."
    exit 1
fi

date=$(date +%Y-%m-%d)

if [ "$COMPACT" = true ]; then
    new_file="${date}-${file}"
else
    new_file="${date} - ${file}"
fi

mv -i "$file" "$new_file"
echo "'$file' moved to '$new_file'"
