#!/bin/bash

# ----------------------------------------------------
# Challenge 3 - File Checker with Permissions
# This script checks whether a file exists and
# whether it is readable, writable, and executable.
# ----------------------------------------------------

# Ask the user to enter a filename or file path
echo "Enter the filename or file path to check:"
read filename

# Check whether the file exists
if [ -e "$filename" ]
then
    echo
    echo "File '$filename' exists."

    # Check if the file is readable
    if [ -r "$filename" ]
    then
        echo "✓ File is readable."
    else
        echo "✗ File is not readable."
    fi

    # Check if the file is writable
    if [ -w "$filename" ]
    then
        echo "✓ File is writable."
    else
        echo "✗ File is not writable."
    fi

    # Check if the file is executable
    if [ -x "$filename" ]
    then
        echo "✓ File is executable."
    else
        echo "✗ File is not executable."
    fi

else
    echo
    echo "File '$filename' does not exist."
fi