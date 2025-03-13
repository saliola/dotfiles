#!/bin/bash

# - Encrypts a PDF file using pdftk.
# - Prompts the user for the user and owner passwords.
# - Any additional command line arguments are passed to pdftk.
#
# EXAMPLES:
#
# To encrypt a pdf file:
#   > pdfencrypt.sh filename.pdf
#
# To allow printing of the encrypted pdf,
# one can set an empty *owner* password; or
# pass the argument `allow printing` to pdftk:
#   > pdfencrypt.sh filename.pdf allow printing

OWNER_PW=PROMPT
USER_PW=PROMPT

# Check that at least one argument is given.
if [ "$#" == 0 ]; then
    echo "Usage: $(basename $0) <filename>"
    exit 1
fi

# Get the filename from the command line
FILE="$1"

# Check that the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

# Extract the filename and extension
FILENAME="${FILE%.*}"
EXTENSION="${FILE##*.}"
# echo "FILENAME is '$FILENAME'"
# echo "EXTENSION is '$EXTENSION'"

# Check that the file is a PDF file
if [ ! "$EXTENSION" == "pdf" ]; then
    echo "Error: '$FILE' is not a PDF file."
    exit 1
fi

# Construct the filename for the encrypted file
NEWFILE="${FILENAME}.enc.pdf"
# echo "NEWFILE is '$NEWFILE'"

# Encrypt the PDF file
pdftk "$FILE" output "$NEWFILE" owner_pw $OWNER_PW user_pw $USER_PW ${@:2}

echo "'$FILE' encrypted to '$NEWFILE'"
