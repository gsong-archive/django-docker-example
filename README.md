# Django Docker Example

Example setup of Django development and deployment using Docker.

## Prerequisites

* [Docker Engine][]

## Getting Started

1.  Add Two Environment Files

    Create two environment files: `.env` and `.env.docker.prod`.

    * `.env` is for injecting runtime environments into the Docker containers.
    * `.evn.docker.prod` is used to alter the local environment when using
      Docker commands such as `docker-compose`.

    See [`env.example`][] and [`env.docker.prod.example`][] for more info.

1.  Download and Build Docker Images

    This project builds two images, one for the Django app, and one for the
    Nginx web server.

    ```sh
    make build
    ```

    The following images are also downloaded from [Docker Hub][]:

    * memcached:1.4-alpine
    * mysql:5.7
    * nginx:latest
    * python:3.5

1.  Build and Run Docker Containers

    ```sh
    make dev-up
    ```

    For the production version, which also spins up nginx:

    ```sh
    make prod-up
    ```

1.  Stop and Remove Docker Containers

    ```sh
    make down
    ```


[Docker Engine]: https://docs.docker.com/engine/installation/
[Docker Hub]: https://hub.docker.com
[`env.docker.prod.example`]: env.docker.prod.example
[`env.example`]: env.example
