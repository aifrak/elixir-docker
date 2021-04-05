# Elixir in Docker

Installation of dockerized Elixir (Debian).

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/aifrak/elixir)](https://hub.docker.com/r/aifrak/elixir/builds)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/aifrak/elixir?color=orange&sort=semver)](https://hub.docker.com/r/aifrak/elixir/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/aifrak/elixir?color=yellow)](https://hub.docker.com/r/aifrak/elixir/)
[![GitHub](https://img.shields.io/github/license/aifrak/elixir-docker?color=blue)](https://github.com/aifrak/elixir-docker/blob/master/LICENSE)

## How to use this image

Short syntax:

```
docker run --rm -it -v [DIR]:/app aifrak/elixir
```

Long syntax:

```
docker run --rm -it -v [DIR]:/app aifrak/elixir
```

This example runs the image with the current host directory inside the container.

```
docker run --rm -it -v $(pwd):/app aifrak/elixir
```

### `DIR`

Directory of your project on the host. Its content will copied inside the container under `/app`.

### `/app`

Directory in the container which will contain your Elixir project.

It is also the default working directory of the container.

### Default user

The default user used by the container is `app-user`. Its user folder is also created inside the `/home`.

## Docker

```
docker pull aifrak/elixir
```

## Quick references

- __Docker hub__: https://hub.docker.com/r/aifrak/elixir
- __Github__: https://github.com/aifrak/elixir-docker

## Inspirations

- [Elixir image by bitwalker](https://github.com/bitwalker/alpine-elixir)
- [Elixir guide](https://hexdocs.pm/elixir)

## Technologies

- [Elixir](https://elixir-lang.org/)
- [Erlang](https://www.erlang.org/)
