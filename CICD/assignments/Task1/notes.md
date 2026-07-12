# Task 1 - Building a Basic CI Pipeline with GitHub Actions

## Goal

The goal of this task was to build a basic Continuous Integration (CI) pipeline using GitHub Actions.

The pipeline automatically runs every time code is pushed to the repository or when a Pull Request is created or updated.

Since this repository mainly contains notes and documentation, I created a small Node.js demo project to simulate a real application that the pipeline could build and test.

---

# Project Structure

The demo project is stored in:

```text
CICD/
└── assignments/
    └── Task1/
        ├── package.json
        ├── package-lock.json
        ├── index.js
        └── test.js
```

The GitHub Actions workflow is stored in:

```text
.github/workflows/ci.yml
```

GitHub only searches this folder for workflow files, which is why it must always be placed at the root of the repository!

---

# What the Pipeline Does

The workflow:

1. Runs on every push.
2. Runs on every pull request.
3. Downloads the repository onto the GitHub runner.
4. Sets up the required Node.js version.
5. Installs project dependencies (however, this project has no dependecies right now).
6. Runs the project tests.

---

# Workflow Breakdown

## Triggering the Workflow

```yaml
on:
  push:
  pull_request:
```

This tells GitHub when the workflow should start.

- `push` runs after every commit pushed to the repository.
- `pull_request` runs whenever a Pull Request is opened, reopened or updated.

---

# Reusing Existing GitHub Actions

One of the main concepts in this task was learning how to reuse existing GitHub Actions instead of writing everything from scratch.

The workflow uses two official GitHub Actions maintained by GitHub:

```yaml
- uses: actions/checkout@v4
```

```yaml
- uses: actions/setup-node@v4
```

These actions are already built, tested and maintained by GitHub.

Instead of writing my own scripts to clone the repository or install Node.js, I reused these existing actions, and this makes workflows quicker to build, easier to maintain and more reliable.

Using reusable actions also follows the **DRY (Don't Repeat Yourself)** principle because it avoids duplicating functionality that already exists.

It also highlights the difference between two important GitHub Actions keywords:

- **uses** → Executes an existing GitHub Action.
- **run** → Executes terminal commands on the runner.

---

## Checkout

```yaml
- uses: actions/checkout@v4
```

GitHub creates a brand-new virtual machine every time the workflow runs.

That machine does not contain the repository, so the first step is downloading the project files.

Without this step, the remaining commands would have nothing to work with.

---

## Setting up Node.js

```yaml
- uses: actions/setup-node@v4
```

This action installs and configures the required version of Node.js so npm commands can be executed during the workflow.

Using the same Node.js version locally and in CI helps keep builds consistent.

---

## Installing Dependencies

The workflow uses:

```yaml
run: npm ci
```

Initially this failed because there was no `package-lock.json`.

The error was:

> npm ci can only install with an existing package-lock.json

The solution was to first run the following command locally:

```bash
npm install
```

This generated a `package-lock.json` file, which also needed to be committed to the repository.

After that, `npm ci` worked correctly.

Although this demo project has no external dependencies, using `npm ci` reflects standard CI/CD practice because it installs packages exactly as recorded in the lock file, making builds reproducible and consistent.

---

## Running Tests

```yaml
run: npm test
```

This executes the test script defined inside `package.json`.

If the assertion fails, the workflow fails.

If the assertion passes, the workflow completes successfully.

---

## Working Directory

The Node.js project is stored inside:

```text
CICD/
└── assignments/
    └── Task1/
```

By default, GitHub Actions executes run commands from the repository root. Since the project's `package.json` is stored inside the Task1 folder, commands such as `npm ci` or `npm test` would not be able to find it.

To solve this, the workflow defines a default working directory:

```yml
defaults:
  run:
    working-directory: CICD/assignments/Task1
```

This tells GitHub Actions to automatically execute every run command from the Task1 folder, so there is no need to specify the path for every individual command. It keeps the workflow cleaner and avoids repeating the same configuration.

Important: This setting only affects the GitHub Actions runner! It does not change how commands are executed in your local terminal.

When working locally, you still need to either:

```bash
cd CICD/assignments/Task1```
npm test
```

or run the command from the repository root using:

```bash
npm --prefix CI-CD/Assignments/Task1 test
```

In short, GitHub Actions automatically changes to the configured working directory before executing run commands, whereas your local terminal only executes commands from the directory you are currently in.

---

# What I Learned

Through this task I learned:

- How GitHub Actions workflows are structured.
- Why workflow files must be placed inside `.github/workflows`.
- The difference between `uses` and `run`.
- How reusable GitHub Actions simplify CI/CD workflows.
- The purpose of `actions/checkout` and `actions/setup-node`.
- Why GitHub runners always start from a clean environment.
- Why `package-lock.json` is required when using `npm ci`.
- Why `working-directory` is useful when a project is stored inside a subfolder.
- How a simple CI pipeline automatically validates code after every push and pull request.