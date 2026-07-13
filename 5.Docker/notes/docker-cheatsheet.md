# Docker Basics & Benefits Cheat Sheet

> A practical revision guide that is also written to help you understand **Docker** for the first time.

------------------------------------------------------------------------

# 1. What is Docker?

Docker is a **containerisation platform**. It lets you package an application together with everything it needs to run, such as libraries, dependencies and configuration files.
The result is a **container** that behaves consistently no matter where it runs.

Think of it like this:
-   **Image** → Blueprint
-   **Container** → Running application created from that blueprint


# Quick Memory Tips

-   Image → Blueprint
-   Container → Running instance
-   Dockerfile → Instructions to build an image
-   Docker Compose → Manage multiple containers
-   Volume → Persistent storage
-   Network → Lets containers communicate
-   Docker Hub → Public registry
-   Docker Engine → Core Docker service

------------------------------------------------------------------------

# 2. Containers vs Virtual Machines

## Containers

-   Share the host operating system kernel
-   Lightweight and fast
-   Usually start within seconds
-   Use fewer system resources

## Virtual Machines

-   Include a complete guest operating system
-   Require more CPU, RAM and storage
-   Take longer to boot
-   Better when complete OS isolation is required

**Remember**

--Containers isolate **processes**.

--Virtual machines isolate **entire operating systems**.

------------------------------------------------------------------------

# 3. Docker Architecture

Docker is made up of a few important parts.

## Docker Engine

The core service running on your machine. It builds images, starts containers and manages networking and storage.

## Docker Hub

A public registry where Docker images are stored.

Useful commands:

``` bash
docker pull nginx
docker push my-image
```

## Docker Compose

Used for applications that need multiple containers working together.

Example:

-   Flask application
-   MySQL database

Instead of starting everything manually, Compose starts the whole stack.

------------------------------------------------------------------------

# 4. Images and Containers

## Image

An image is a read-only template.

It contains:
-   Application code
-   Dependencies
-   Runtime
-   Configuration

One image can create many containers.

## Container

A running instance of an image.

You can:
-   Start it
-   Stop it
-   Remove it
-   Create another one from the same image

------------------------------------------------------------------------

# 5. Installing Docker

Install **Docker Desktop**.

Verify everything works:

``` bash
docker --version
docker info
docker run hello-world
```

If `hello-world` runs successfully, Docker is working correctly.

------------------------------------------------------------------------

# 6. Commands You Should Know

Create and run a container:

``` bash
docker run nginx
```

Run in the background:

``` bash
docker run -d nginx
```

Map ports:

``` bash
docker run -d -p 5002:5002 image_name
```

List running containers:

``` bash
docker ps
```

List all containers:

``` bash
docker ps -a
```

Stop a container:

``` bash
docker stop container_name
```

Remove a container:

``` bash
docker rm container_name
```

List images:

``` bash
docker images
```

Remove an image:

``` bash
docker rmi image_name
```

Clean unused Docker resources:

``` bash
docker system prune
```

------------------------------------------------------------------------

# 7. Dockerfile Basics

A Dockerfile contains instructions for building an image.

Common instructions:

## FROM

Specifies the base image.

``` dockerfile
FROM python:3.12
```

## WORKDIR

Sets the working directory for everything that follows.

``` dockerfile
WORKDIR /app
```

## COPY

Copies files from your machine into the image.

``` dockerfile
COPY . .
```

## RUN

Executes commands while building the image.

``` dockerfile
RUN pip install -r requirements.txt
```

## EXPOSE

Documents which port the application listens on.

``` dockerfile
EXPOSE 5002
```

It does **not** publish the port.

## CMD

Specifies the default command when the container starts.

``` dockerfile
CMD ["python", "app.py"]
```

### COPY vs ADD

Both copy files into the image.

`ADD` can also:

-   Download from URLs
-   Extract local tar archives

For normal projects, try using **COPY** because it is clearer.

------------------------------------------------------------------------

# 8. Building and Running Images

Build an image:

``` bash
docker build -t flask-app .
```

Run it:

``` bash
docker run -d -p 5002:5002 flask-app
```

The `-p` flag maps:

    host_port -> container_port

Example:

    5002 -> 5002

------------------------------------------------------------------------

# 9. Flask Example

The workflow is always roughly the same.

Application code

↓

Dockerfile

↓

docker build

↓

Docker image

↓

docker run

↓

Application available in your browser through localhost. The same idea applies to most applications, not just Flask.

------------------------------------------------------------------------

# 10. Networking

Create a network:

``` bash
docker network create my-network
```

Containers on the same network can communicate using container names.

Example:

    Flask App  ->  mysql

No IP addresses required.

------------------------------------------------------------------------

# 11. Environment Variables

Configuration can be passed into containers.

Example:

``` bash
docker run -e MYSQL_ROOT_PASSWORD=password mysql
```

This keeps configuration separate from your application code.

------------------------------------------------------------------------

# 12. Docker Compose

Compose is designed for multi-container applications.

Typical services:

-   Web application
-   Database
-   Redis
-   API

Start everything:

``` bash
docker-compose up
```

Stop everything:

``` bash
docker-compose down
```

Compose automatically:
-   Creates a network
-   Connects services together
-   Lets services communicate using service names

Example:
    web
    database
    redis

Instead of using IP addresses, the web service simply connects to **database**.

### depends_on

Controls startup order.

Example:

    Database starts
    ↓
    Web application starts

------------------------------------------------------------------------

# 13. Volumes

Containers are temporary.

Without a volume, data disappears when the container is removed.
Volumes provide persistent storage.

You can use:
-   Named volumes
-   Host directory mounts

------------------------------------------------------------------------

# 14. Registries

Download an image:

``` bash
docker pull image_name
```

Upload an image:

``` bash
docker push image_name
```

## AWS ECR

AWS Elastic Container Registry is a private Docker registry.

Typical workflow:

Authenticate → Tag image → Push image

------------------------------------------------------------------------

# Docker Build vs Docker Run

People often confuse these two commands, but they do completely different jobs.

## docker build

Creates a Docker image from a Dockerfile.

``` bash
docker build -t my-app .
```

Think of it as:

    Dockerfile
    ↓
    Docker Image

## docker run

Creates and starts a container from an existing image.

``` bash
docker run -d -p 5002:5002 my-app
```

Think of it as:

    Docker Image
    ↓
    Running Container

------------------------------------------------------------------------

# Multi-Stage Docker Builds

A multi-stage build lets you use more than one `FROM` instruction in the same Dockerfile.

The idea is simple:
-   One stage builds your application.
-   Another stage contains only the files needed to run it.

This keeps the final image much smaller because it doesn't include build tools, source code that isn't needed or temporary files.

Example:

``` dockerfile
# Build stage
FROM node:24 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Runtime stage
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html
```

Why use multi-stage builds?
-   Smaller image sizes
-   Faster downloads and deployments
-   Better security because unnecessary tools are left behind
-   Cleaner production images

Think of it like this:

    Build stage
    ↓
    Runtime stage

The build stage compiles your application, and the runtime stage contains only what is needed to run it.


# 15. Image Optimisation

Use **multi-stage builds**.

This separates:
-   Build environment
-   Runtime environment

Result:
-   Smaller images
-   Faster downloads
-   Better security

------------------------------------------------------------------------

# 16. Debugging

View logs:

``` bash
docker logs container_name
```

Open a shell inside a running container:

``` bash
docker exec -it container_name bash
```

These are usually the first commands you'll use when something goes wrong.

------------------------------------------------------------------------

# 17. Best Practices

-   Use specific image tags instead of `latest`.
-   Keep images as small as possible.
-   Reuse Docker build cache where possible.
-   Minimise Dockerfile layers.
-   Avoid running containers as the root user.
-   Use `.dockerignore` to exclude unnecessary files from the build context.
-   Give images meaningful names.
-   Remove unused containers and images regularly.

------------------------------------------------------------------------

