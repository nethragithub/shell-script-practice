#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Transpose rows to columns using awk
transpose() {
    awk '
    {
        for (i = 1; i <= NF; i++) {
            a[i] = a[i] ? a[i] " " $i : $i
        }
    }
    END {
        for (i = 1; i <= NF; i++) {
            print a[i]
        }
    }' "$FILE"
}

# Call the function
transpose
