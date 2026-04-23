# Linux Module Summary

Linux is a powerful open-source operating system that underpins most modern infrastructure, especially in servers, cloud environments, and DevOps workflows. Learning Linux properly is less about memorising commands and more about understanding how to investigate a system when something isn’t working as expected.

A useful way to approach Linux is to think in terms of:
**observe → understand → act**

In practice, that means checking what’s happening before trying to fix anything, using the tools available to inspect files, processes, and system state.

---

## 🧠 How to Approach Problems

When something goes wrong, avoid jumping straight into solutions. Instead, break things down:

- Where am I in the system?
- What is currently running?
- What changed or might be misconfigured?
- What is the system already telling me (errors/logs)?

For example, if an application fails:
- Check if the process is running
- Check logs for errors
- Check if the port is open
- Check if the system can reach it

Linux gives you visibility—you just need to use it methodically.

---

## 📁 File System & Navigation

Linux uses a hierarchical file system starting at `/`.

### Navigation & listing:
- `pwd` → show current directory  
- `ls`, `ls -l`, `ls -la`, `ls -lh` → list files with different levels of detail  
- `cd` → move directories  
- `tree` → visual structure of directories  

### Finding files:
- `find /path -name file.txt` → search by name  
- `find . -type f` → find files  
- `locate file.txt` → quick search (indexed)  

### File operations:
- `cp` → copy  
- `mv` → move/rename  
- `rm`, `rm -r`, `rm -rf` → remove  
- `mkdir`, `mkdir -p` → create directories  
- `rmdir` → remove empty directory  
- `touch` → create file  

### Viewing files:
- `cat` → print file  
- `less` / `more` → scroll through file  
- `head`, `tail` → view start/end  
- `tail -f` → live log output  

### Text processing:
- `grep` → search text  
- `cut`, `awk`, `sed` → process and manipulate text  
- `sort`, `uniq`, `wc` → analyse text  

### How to think:
If you don’t know where something is, don’t guess and start searching for it. 
If something looks wrong, inspect the file contents before changing anything.

---

## 🔐 File Permissions & Ownership

Files have permissions for user, group, and others.

### Commands:
- `ls -l` → view permissions  
- `chmod` → change permissions  
- `chown` → change ownership  
- `groups` → check user groups  
- `id` → user identity info  

### How to think:
When you see **permission denied**:
- Check ownership  
- Check permission bits  
- Decide whether to change permissions or switch user  

Using `sudo` is not a solution—it’s a shortcut. Understand the access model instead.

---

## ⚙️ Process Management

Processes represent running programs.

### Commands:
- `ps aux` → list all processes  
- `top` / `htop` → live monitoring  
- `pgrep` → find process by name  
- `kill <PID>` → terminate process  
- `kill -9 <PID>` → force kill  
- `pkill <name>` → kill by name  
- `nice`, `renice` → adjust priority  
- `jobs`, `bg`, `fg` → manage background jobs  

### How to think:
If something is slow or stuck:
- Identify what’s running  
- Look for high CPU/memory usage  
- Decide whether to stop or adjust  

Don’t act until you know what the process is doing.

---

## 📦 Package Management

Used to install and maintain software.

### Debian/Ubuntu:
- `apt update` → refresh packages  
- `apt upgrade` → upgrade system  
- `apt install <pkg>` → install  
- `apt remove <pkg>` → remove  
- `apt search <pkg>` → search packages  


### How to think:
If software isn’t working:
- Check if it’s installed  
- Check version  
- Check dependencies  

Many issues come down to missing or outdated packages.

---

## 🌐 Networking Basics

Networking helps systems communicate.

### Commands:
- `ping` → connectivity test  
- `curl` → test APIs/endpoints  
- `wget` → download files  
- `ss` / `netstat` → open ports  
- `ifconfig` / `ip addr` → IP details  
- `ip route` → routing table  
- `hostname` → system name  
- `nslookup`, `dig` → DNS resolution  

### How to think:
Break connection issues into layers:

1. Network reachable? → `ping`  
2. DNS resolving? → `dig`  
3. Service running? → `ss`  
4. Endpoint responding? → `curl`  

This avoids random guessing.

---

## 📝 Shell Scripting & Automation

Shell scripts automate tasks and combine commands.

### Basics:
- Bash scripts (`.sh`)  
- Variables, loops, conditionals  
- Input/output handling  

### Commands:
- `chmod +x script.sh` → make executable  
- `./script.sh` → run script  
- `crontab -e` → schedule jobs  

### How to think:
If you repeat something more than a few times, automate it. Scripts reduce errors and save time.

---

## 📊 System Monitoring & Disk Usage

Understanding system health is essential.

### Commands:
- `df -h` → disk space  
- `du -sh` → directory size  
- `free -h` → memory usage  
- `uptime` → system load  
- `who`, `whoami` → user info  

### How to think:
If a system behaves oddly:
- Check disk space  
- Check memory  
- Check system load  

A full disk or exhausted memory can break everything.

---

## 🚀 Why This Matters

These skills are directly used in:
- CI/CD pipelines  
- Docker and containers  
- Cloud platforms  
- Infrastructure automation  

Being able to investigate and reason through issues in Linux is what separates someone who follows steps from someone who actually understands systems.

---

## 💡 Final Thoughts

You don’t need to memorise everything here. What matters is:

- knowing what kind of problem you’re dealing with  
- knowing which area to investigate  
- and being comfortable exploring until things make sense  

Over time, the commands become familiar.

The real skill is being able to look at a problem and think:
“I don’t know the answer yet, but I know how to break this down.”

That’s what actually makes you effective with Linux.