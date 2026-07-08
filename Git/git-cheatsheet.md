# Git - My Notes

## What is Git?

Git is a distributed version control system. Instead of tracking
individual file changes, Git stores **snapshots** of your project over
time.

Git stores everything in the `.git` folder using SHA-1 hashes and
objects:

-   **Blob** = file contents
-   **Tree** = directory structure
-   **Commit** = project snapshot + metadata
-   **SHA-1 hash** = unique identifier for Git objects

------------------------------------------------------------------------

## Repository Structure

The `.git` directory contains:

-   `objects/` - all Git objects
-   `refs/` - branches and tags
-   `HEAD` - current branch/reference
-   `index` - staging area
-   `config` - repository configuration

------------------------------------------------------------------------

## Basic Workflow

``` text
Working Directory
       │
       ▼
git add
       │
       ▼
Staging Area
       │
       ▼
git commit
       │
       ▼
Repository
```

------------------------------------------------------------------------

## Configure Git

``` bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --list
```

------------------------------------------------------------------------

## Creating & Cloning Repositories

``` bash
git init
git clone <repo-url>
```

------------------------------------------------------------------------

## Essential Commands

``` bash
git status
git status -s
git add file
git add .
git commit -m "message"
git commit -am "message"
```

`git commit -am` only stages **tracked** files.

------------------------------------------------------------------------

# Common Lifesaver Commands

## Stash work temporarily

``` bash
git stash
```

Save your current work without committing it.

``` bash
git stash pop
```

Restore the latest stash and remove it from the stash list.

Other useful stash commands:

``` bash
git stash list
git stash apply
git stash drop
```

------------------------------------------------------------------------

## Jump Back to the Previous Branch

``` bash
git switch -
```

or

``` bash
git checkout -
```

Switches straight back to the last branch you were working on.

------------------------------------------------------------------------

## Sync Local Branch with Remote (My Workflow)

If I want my local branch to exactly match the remote but keep my local
work, I use:

``` bash
git stash
git fetch
git reset --hard origin/<branch-name>
git stash pop
```

Example:

``` bash
git stash
git fetch
git reset --hard origin/main
git stash pop
```

This workflow:

-   Saves my local changes.
-   Updates my branch to exactly match the remote.
-   Reapplies my local changes afterwards.

> **Note:** `git stash pop` can still produce merge conflicts if your
> stashed changes overlap with changes from the remote.

------------------------------------------------------------------------

## Undo the Last Commit (Not Pushed)

Keep changes staged:

``` bash
git reset --soft HEAD~1
```

Keep changes but unstage them:

``` bash
git reset HEAD~1
```

Delete the commit and the changes:

``` bash
git reset --hard HEAD~1
```

------------------------------------------------------------------------

## Undo a Commit That Has Already Been Pushed

``` bash
git revert HEAD
```

or

``` bash
git revert <commit>
```

This creates a new commit that reverses the changes instead of rewriting
history.

------------------------------------------------------------------------

## Rebase

``` bash
git rebase main
```

Or update from the remote first:

``` bash
git fetch
git rebase origin/main
```

Interactive rebase:

``` bash
git rebase -i HEAD~3
```

Use interactive rebase to:

-   Squash commits
-   Reorder commits
-   Edit commit messages
-   Clean up commit history before opening a pull request

**Rebase** creates a clean, linear history. **Merge** preserves the full
branch history.

------------------------------------------------------------------------

## File Operations

``` bash
git rm file
git mv old new
git restore file
git restore --staged file
git restore --source=HEAD file
```

------------------------------------------------------------------------

## Viewing History

``` bash
git log
git log --oneline
git log --oneline --graph --all
git log --grep="text"
git show <commit>
git blame file
```

------------------------------------------------------------------------

## Differences

``` bash
git diff
git diff --staged
git diff HEAD
```

------------------------------------------------------------------------

## Branches

``` bash
git branch
git branch --show-current
git switch -c feature
git checkout -b feature
git switch main
git branch -d feature
git branch -m new-name
```

------------------------------------------------------------------------

## Remote Repositories

``` bash
git remote add origin <url>
git remote -v
git fetch
git pull
git push
git push -u origin main
git remote remove origin
```

------------------------------------------------------------------------

## SSH

``` bash
ssh-keygen -t ed25519 -C "email@example.com"
ssh -T git@github.com
```

------------------------------------------------------------------------

## Tags

``` bash
git tag v1.0.0
git push origin v1.0.0
```

------------------------------------------------------------------------

## Useful Commands

``` bash
git ls-files
git rev-parse HEAD
git clean -fdn
git clean -fd
```

`git clean -fdn` previews what would be deleted before running
`git clean -fd`.
