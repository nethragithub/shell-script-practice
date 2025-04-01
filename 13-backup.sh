#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign input arguments to variables
SOURCE_DIR="$1"
DEST_DIR="$2"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist!"
    exit 1
fi

# Check if the destination directory exists, create if it doesn't
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
fi

# Get the current timestamp for the archive name (format: YYYY-MM-DD_HH-MM-SS)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a compressed archive (.tar.gz) in the destination folder
ARCHIVE_NAME="$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"
tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $DEST_DIR/$ARCHIVE_NAME"
else
    echo "Backup failed!"
    exit 1
fi
