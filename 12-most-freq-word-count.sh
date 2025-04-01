#!/bin/bash

# Check if a file name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <07-installation-logs-colors-validate-loops.sh>"
    exit 1
fi

# File to count words from
FILE="$1"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Count the words using `wc`
WORD_COUNT=$(tr -c '[:alnum:]' '[\n*]' < $FILE | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 5
)

# Display the result
echo "Word count in '$FILE': $WORD_COUNT"
