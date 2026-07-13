# CI/CD with GitHub Actions Cheatsheet

## CI/CD Fundamentals

### Continuous Integration (CI)

**What it is:** Developers merge code into a shared repository frequently.

**Why it exists:** Integrating small changes often makes bugs easier to find and fix. Instead of discovering problems days or weeks later, the pipeline tells you almost immediately if something has broken.

**How it's is used:** Every push normally triggers a workflow that checks out the code, installs dependencies, runs linting, builds the application and executes tests.

### Continuous Delivery vs Continuous Deployment

**Continuous Delivery** 
- Builds and tests happen automatically  
- The application is always ready to release 
- Someone approves the deployment to production.

**Continuous Deployment** 
- Builds, tests and deployment are all automated 
- If every check passes, the application is deployed without manual approval.

A common exam question is the difference between these two.

## Why teams use CI/CD

CI/CD reduces repetitive manual work and gives fast feedback. Instead of wondering whether new code broke something, every commit is verified automatically.

Main benefits: 
- Faster releases 
- Better software quality 
- Early bug detection 
- Consistent deployments 
- Better collaboration across teams
- Less manual work

Typical pipeline:

Source Control → Build → Lint → Test → Staging → Production → Monitoring

Monitoring matters because production feedback helps improve the next release.

## GitHub Actions

GitHub Actions is GitHub's built-in CI/CD platform. 
Workflows live in: `.github/workflows/`

Workflow files are written in YAML (`.yml` or `.yaml`).

Every workflow has four main parts:

-   **name** - friendly workflow name.
-   **on** - event that starts the workflow.
-   **jobs** - groups of work.
-   **steps** - commands or actions inside each job.

Typical triggers: 
- push 
- pull_request 
- schedule 
- workflow_dispatch (manual)

Jobs usually run in parallel. Steps inside a job always run sequentially.

`runs-on` defines the operating system: 
- ubuntu-latest 
- windows-latest 
- macos-latest

## The keywords you'll use all the time

### uses

Runs a reusable GitHub Action.

### run

Executes shell commands directly.

### with

Passes inputs into an action.

### if

Controls whether a job or step runs.

### env

Stores non-sensitive configuration values.

### secrets

Stores sensitive values such as passwords, API keys and tokens.

Use: `${{ secrets.NAME }}`

Never hardcode secrets into code!!!

## YAML Basics

YAML is the configuration language used by GitHub Actions.

Important concepts:

-   Key-value pairs
-   Lists
-   Indentation for nesting
-   Comments with \#

Most workflow problems come from incorrect indentation.

## Matrix Builds

A matrix lets one workflow test multiple configurations without duplicating code.

Typical uses: 
- Multiple Python versions 
- Multiple Node versions 
- Multiple operating systems

This improves confidence that your application works everywhere.

## Expressions

Expressions let you access workflow data.

Examples:

`${{ github.ref }}`

`${{ matrix.python-version }}`

These are commonly used in conditions and dynamic configuration.

## Reusable Actions and DRY

There are three action types: 
- JavaScript 
- Docker 
- Composite

Reusable actions follow the **DRY principle (Don't Repeat Yourself)**.
Instead of copying the same workflow logic into every repository, create it once and reuse it.

Benefits: 
- Easier maintenance 
- Consistent pipelines 
- Fewer mistakes

## Security

Good practices: 
- Store secrets securely 
- Follow the Principle of Least Privilege
- Rotate credentials regularly 
- Scan dependencies for vulnerabilities.

Avoid: 
- Hardcoded credentials 
- Overly broad permissions 
- Committing secrets to Git

State locking prevents multiple deployments from modifying infrastructure simultaneously.

## Debugging

If a workflow fails: 
1. Read the logs 
2. Check YAML formatting
3. Check permissions
4. Verify dependencies
5. Re-run failed jobs

For Bash scripts:

`set -x` -> prints each command as it executes.

## Docker

GitHub Actions can: 
- Build Docker images
- Push images to registries
- Deploy containers automatically

Multi-stage Docker builds help reduce image size and improve efficiency.

## Deployment Strategies

**Dev** testing environment.

**Staging** is the final testing environment.

**Production** is the live environment.

Common deployment strategies: 
- Rolling 
- Blue-Green 
- Canary

Choose the strategy based on the level of risk and the amount of downtime you can tolerate.

## Quick Revision

-   CI = Continuous Integration
-   CD = Continuous Delivery or Continuous Deployment
-   Workflow folder = `.github/workflows`
-   Workflow = Events → Jobs → Steps
-   `uses` = reusable action
-   `run` = shell commands
-   `with` = action inputs
-   `if` = conditional execution
-   `workflow_dispatch` = manual run
-   `runs-on` = operating system
-   YAML = indentation matters
-   Secrets = `${{ secrets.NAME }}`
-   DRY = Don't Repeat Yourself
-   Least Privilege = only required permissions
