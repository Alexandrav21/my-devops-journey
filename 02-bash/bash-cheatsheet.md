# Bash Scripting - My Notes

## What is Bash?

Bash (Bourne Again SHell) is both a shell and a scripting language. It lets you automate tasks by putting commands into a script instead of typing them one by one.

------------------------------------------------------------------------

## Shebang

Every Bash script should start with a shebang:

``` bash
#!/bin/bash
```

The shebang tells Linux which interpreter should run the script. Without it, the system may try to execute the script using a different shell.

------------------------------------------------------------------------

## Running Bash Scripts

Make the script executable:

``` bash
chmod +x script.sh
```

You can then run it in several ways:

``` bash
./script.sh
```

Runs the script directly (requires execute permission and usually a shebang).

``` bash
bash script.sh
```

Runs the script explicitly with Bash. The script does **not** need execute permission.

``` bash
sh script.sh
```

Runs the script with `sh`. Be careful---`sh` isn't always Bash, so Bash-specific features may fail.

------------------------------------------------------------------------

## Variables

Variables have **no spaces** around the `=`.

``` bash
name="Alexandra"
age=27
```

Access variables with:

``` bash
echo $name
echo ${name}
```

`${}` is useful when combining variables with text.

Arrays:

``` bash
fruits=("apple" "banana" "orange")

echo ${fruits[0]}
echo ${fruits[@]}
```

------------------------------------------------------------------------

## User Input

``` bash
read name
```

Prompt the user:

``` bash
read -p "Enter your name: " name
```

------------------------------------------------------------------------

## Script Parameters

If the script is run like this:

``` bash
./script.sh Lexi 27
```

Then:

-   `$0` = script name
-   `$1` = first argument
-   `$2` = second argument
-   `$@` = all arguments
-   `$#` = number of arguments

------------------------------------------------------------------------

## Arithmetic

``` bash
result=$((5 + 3))
```

Operators:

-   `+`
-   `-`
-   `*`
-   `/`
-   `%`
-   `++`

------------------------------------------------------------------------

## Conditionals

``` bash
if [ condition ]; then
    commands
elif [ other_condition ]; then
    commands
else
    commands
fi
```

### Number comparisons

-   `-eq`
-   `-ne`
-   `-lt`
-   `-gt`
-   `-le`
-   `-ge`

### String comparisons

-   `==`
-   `!=`
-   `-z`
-   `-n`

### File tests

-   `-f`
-   `-d`
-   `-r`
-   `-w`
-   `-x`

### Logical operators

``` bash
[[ condition1 && condition2 ]]
[[ condition1 || condition2 ]]
! condition
```

------------------------------------------------------------------------

## Loops

### While

``` bash
while [ condition ]; do
    commands
done
```

### For

``` bash
for i in {1..5}; do
    echo $i
done
```

``` bash
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done
```

``` bash
for ((i=1; i<=5; i++)); do
    echo $i
done
```

Loop control:

-   `break`
-   `continue`

------------------------------------------------------------------------

## Functions

``` bash
hello() {
    echo "Hello $1"
}
```

Local variables:

``` bash
local name="Alexandra"
```

Return values:

``` bash
return 0
return 1
```

Check with:

``` bash
echo $?
```

------------------------------------------------------------------------

## Error Handling

``` bash
set -e
set -u
set -x
set +x
set -eux
```

-   `-e` = exit on error
-   `-u` = error on undefined variables
-   `-x` = show commands as they run

------------------------------------------------------------------------

## Environment Variables

``` bash
echo $HOME
echo $USER
echo $PATH
echo $SHELL

export PROJECT=devops
```

------------------------------------------------------------------------

## File Operations

Overwrite:

``` bash
echo "Hello" > file.txt
```

Append:

``` bash
echo "Hello" >> file.txt
```

Read line by line:

``` bash
while read line; do
    echo "$line"
done < file.txt
```

------------------------------------------------------------------------

## Input Validation

Check for:

-   Empty input
-   Numbers
-   Existing files
-   Existing directories

Handle invalid input instead of letting the script fail.

------------------------------------------------------------------------

## Comments

Single line:

``` bash
# This is a comment
```

Multi-line:

``` bash
: '
Multiple
line
comment
'
```
