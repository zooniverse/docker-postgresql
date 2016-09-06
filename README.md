# Docker Postgresql server

[postgresql]: http://www.postgresql.org/
[docker postgresql]: https://hub.docker.com/r/_/postgres/

## Why?

This docker images uses the offical docker postgresql image
(9.4 currently, see Dockerfile) as a base image and provides the ability to
inject custom server configuration directives on build the server starts.

## How

It adds a server directive to load extra configurations (if they exist) at
`/etc/postgres/postgresql.conf`. The Dockerfile copies the custom configuration
from `./extra_postgresql.conf` to the docker container.

See `scripts/modify_config.sh` for details.

## Usage

Modify the `extra_postgresql.conf` file to add the desireed server config
directives and then build and tag the image for use.

## Image Creation

Creates the image with the tag `postgresql:panoptes_test`, change
for you needs at your leisure.

```
$ docker build -t postgresql:panoptes_test .
```

## Using the built images

Reference the derived local image `postgresql:panoptes_test` via docker or compose.

Docker run cmd:
```
$ docker run -d --name postgres -e POSTGRES_USER=panoptes -e POSTGRES_PASSWORD=panoptes --publish 5432:5432 postgres:panoptes_test
```

Docker compose config:
```
postgres:
  image: postgres:panoptes_test
  environment:
    - "POSTGRES_USER=panoptes"
    - "POSTGRES_PASSWORD=panoptes"
  ports:
    - "5432:5432"
```
