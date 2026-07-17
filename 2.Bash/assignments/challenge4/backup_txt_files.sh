#!/bin/bash

# ----------------------------------------------------
# Challenge 4 - Backup Script for Text Files
# This script copies all .txt files from a source
# directory into a new backup directory with a
# timestamp in its name.
# ----------------------------------------------------

# Ask the user for the source directory
echo "Enter the source directory:"
read source_directory

# Check if the source directory exists
if [ ! -d "$source_directory" ]
then
    echo "The directory '$source_directory' does not exist."
    exit 1
fi

# Create a timestamp (for example: 2026-07-17_11-15-30)
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup directory name
backup_directory="backup_$timestamp"

# Create the backup directory
mkdir "$backup_directory"

echo
echo "Backup directory created: $backup_directory"
echo "Copying .txt files..."

# Copy all .txt files from the source directory
cp "$source_directory"/*.txt "$backup_directory" 2>/dev/null

# Count how many .txt files were copied
file_count=$(find "$backup_directory" -name "*.txt" | wc -l)

echo
echo "Backup complete!"
echo "Files backed up: $file_count"