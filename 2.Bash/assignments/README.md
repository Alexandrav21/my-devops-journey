# Assignments

# 1: Basic Arithmetic Calculator

## Objective

Create a Bash script that asks the user for two numbers, performs the four basic arithmetic operations, and handles division by zero.

## Commands Used

``` bash
chmod +x calculator.sh
./calculator.sh
```

## Output

The script prompted for two numbers, displayed the results for addition, subtraction, multiplication, and division, and showed a message when the
second number was zero.

## Challenges

I accidentally ran the script using the wrong path at first. Once I used `./calculator.sh`, it worked as expected.

## What I Learned

I learned how to use `read`, variables, arithmetic operations, `if` statements, and how to make a Bash script executable.

------------------------------------------------------------------------

# 2: File Operations Script

## Objective

Create a Bash script that creates a directory, creates a text file, writes the current date to it, and displays the file contents.

## Commands Used

``` bash
chmod +x file_operations.sh
./file_operations.sh
```

## Output

The script created the `bash_demo` directory, created `demo.txt`, wrote the current date to the file, and displayed the file contents.

## Challenges

No major issues. I just made sure I was running the script from the correct directory.

## What I Learned

I learned how to create directories and files, write to a file, use the `date` command, and display file contents with `cat`.

------------------------------------------------------------------------

# 3: File Checker with Permissions

## Objective

Create a Bash script that checks if a file exists and displays whether it is readable, writable, and executable.

## Commands Used

``` bash
chmod +x check_permissions.sh
./check_permissions.sh
```

## Output

The script prompted for a filename, checked if it existed, and displayed its permissions. It also displayed a message if the file did not exist.

## Challenges

I tested the script with both an existing file and a file that didn't exist to make sure both scenarios worked correctly.

## What I Learned

I learned how to check if a file exists and how to use the `-r`, `-w`, and `-x` file permission checks.

------------------------------------------------------------------------

# 4: Backup Script for Text Files

## Objective

Create a Bash script that copies all `.txt` files from a source directory into a backup directory with a timestamp.

## Commands Used

``` bash
chmod +x backup_txt_files.sh
./backup_txt_files.sh
```

## Output

The script created a timestamped backup directory, copied all `.txt` files from the source directory, and displayed how many files were backed up.

## Challenges

I created a test folder with a few sample `.txt` files so I could test that only text files were copied.

## What I Learned

I learned how to copy files, create timestamped directories, count files, and work with directories in Bash.

------------------------------------------------------------------------

# 5: System Monitor Script (Bonus)

## Objective

Create a Bash script that displays system information and saves the output to a timestamped log file.

## Commands Used

``` bash
chmod +x system_monitor.sh
./system_monitor.sh
```

## Output

The script displayed CPU usage, memory usage, disk usage, and the top five processes by memory usage. It also saved the report to a log file.

## Challenges

Some Linux commands were different on macOS, so I had to use macOS-compatible commands to get the required information.

## What I Learned

I learned how to collect system information, save command output to a log file, and create log files with timestamps.