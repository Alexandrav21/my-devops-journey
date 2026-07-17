#!/bin/bash

# ----------------------------------------------------
# Challenge 2 - File Operations Script
# This script creates a directory, creates a file,
# writes the current date to the file, and displays
# the file contents.
# ----------------------------------------------------

# Create a new directory called bash_demo
mkdir bash_demo

# Move into the new directory
cd bash_demo

# Write text to a file called demo.txt
# The $(date) command inserts the current date and time.
echo "This file was created by a Bash script on $(date)" > demo.txt

# Inform the user that the directory and file were created
echo "Directory 'bash_demo' created."
echo "File 'demo.txt' created."

echo

# Display the contents of the file
echo "File contents:"
cat demo.txt