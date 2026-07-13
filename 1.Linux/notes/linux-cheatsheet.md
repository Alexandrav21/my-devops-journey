# Linux Essentials for DevOps - My Notes

## Navigation

-   `pwd` = where am I?
-   `cd folder` = go into folder
-   `cd ..` = go back one directory
-   `cd ~` = home directory

## Listing files

-   `ls` = list files
-   `ls -la` = everything, including hidden files
-   `ls -l` = detailed view (permissions, owner, etc.)
-   `ls -R` = recursive list

## Creating files

-   `touch file.txt` = create empty file
-   `echo "text" > file.txt` = create/overwrite with text
-   `echo "text" >> file.txt` = append text

## Viewing files

-   `cat file` = whole file
-   `head file` = first 10 lines
-   `tail file` = last 10 lines
-   `head -n 5 file` = first 5 lines

## File operations

-   `cp source dest` = copy
-   `cp -r dir newdir` = copy directory
-   `mv old new` = move or rename
-   `rm file` = delete file

## Directories

-   `mkdir folder` = make folder
-   `mkdir -p path/to/folder` = create nested folders
-   `rmdir folder` = remove empty folder
-   `rm -r folder` = remove folder and contents

## Searching

-   `grep "text" file` = search inside file
-   `find /path -name "*.txt"` = find files
-   `which command` = locate command

## Nano (My Editor of choice)

-   `nano file.txt` = open/create a file
-   Just start typing to edit
-   `Ctrl + O` = save ("Write Out")
-   `Enter` = confirm filename
-   `Ctrl + X` = exit Nano
-   `Ctrl + K` = cut current line
-   `Ctrl + U` = paste line back
-   `Ctrl + W` = search
-   `Ctrl + \` = search and replace
-   `Ctrl + G` = help
-   Much easier than Vim for quick edits.

## VIM Basics

-   `vim file` = open file
-   `i` = insert mode
-   `Esc` = command mode
-   `:wq` = save & quit
-   `:q!` = quit without saving

### Navigation

-   `h j k l` = move
-   `/text` = search
-   `n` = next match
-   `dd` = delete line
-   `yy` = copy line
-   `p` = paste

### Extras

-   `:set number` = line numbers
-   `u` = undo
-   `Ctrl + R` = redo
-   `:5` = jump to line 5
-   `0` = start of line
-   `$` = end of line

## Permissions

Remember: - Read = 4 - Write = 2 - Execute = 1

Common: - `755` = rwxr-xr-x - `644` = rw-r--r-- - `600` = rw-------

### chmod

-   `chmod 755 file`
-   `chmod u+x file`
-   `chmod -R 755 folder`
-   `chmod u=rwx,g=rx,o=rx file`

## Users & Groups

-   `sudo` = run as admin
-   `su username` = switch user
-   `whoami` = current user
-   `id` = user info

Create users: - `sudo useradd username` - `sudo passwd username` -
`sudo usermod -aG group user`

Groups: - `groups` - `sudo groupadd groupname` -
`sudo deluser user group`

Ownership: - `chown user:group file` - `chgrp group file` -
`chown -R user:group folder`

## Redirection

-   `>` overwrite output
-   `>>` append output
-   `2>` errors only
-   `&>` stdout + stderr

## Pipes

-   `ls | grep txt`
-   `cat file | head -5 | tail -2`

## Environment Variables

-   `export VAR=value`
-   `echo $VAR`
-   `echo $PATH`
-   `printenv`

## Shells

-   `echo $SHELL`
-   `bash`
-   `zsh`
-   `chsh -s /bin/zsh`

## Shell Config

-   Edit `.bashrc` or `.zshrc`
-   `source ~/.zshrc`
-   `alias ll='ls -la'`

## Oh My Zsh

-   Install it
-   Use Powerlevel10k
-   Add syntax highlighting & autosuggestions

## History

-   `history`
-   `!!`
-   `!123`
-   `Ctrl + R`

## Shortcuts

-   `Ctrl + L`
-   `Ctrl + C`
-   `Ctrl + D`
-   `Tab`
-   `Ctrl + A`
-   `Ctrl + E`

## Help

-   `man command`
-   `man ls`
-   `/search`
-   `q`

## Linux Filesystem

-   `/` = root
-   `/home` = user folders
-   `/etc` = config
-   `/bin` = binaries
-   `/var` = logs & variable data

------------------------------------------------------------------------
