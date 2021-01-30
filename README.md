# Traefik private plugin support
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/PrivPlugMatt/traefik-private-plugins/Apply%20patch%20for%20specific%20branch%20or%20tag)
![Last build](https://img.shields.io/badge/dynamic/json?color=green&label=Last%20build&query=$.workflows[?(@.path==%22.github/workflows/apply-patch.yml%22)].updated_at&url=https%3A%2F%2Fapi.github.com%2Frepos%2FPrivPlugMatt%2Ftraefik-private-plugins%2Factions%2Fworkflows)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pagran/traefik/latest)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pagran/traefik/v2.4.0)


## Overview

[Traefik](https://github.com/traefik/traefik) authors do not see the need to add support for private plugins, forcing to use [Traefik Pilot](https://traefik.io/traefik-pilot/).

They have already rejected several pull requests with different implementations of private plugins ([#7725](https://github.com/traefik/traefik/pull/7725), [#7515](https://github.com/traefik/traefik/pull/7515)) and explained their position in detail ([comment](https://github.com/traefik/traefik/pull/7515#issuecomment-726133992)) 

This project adds support for private plugins.

## Technical details

Traefik is a big project and maintaining a fork that will contain all the latest updates is too complicated. 

I decided to put the support of private plugins into a small patch, which will automatically (using [Github Actions](https://github.com/PrivPlugMatt/traefik-private-plugins/actions)) apply to the actual Traefik sources and send the compiled containers to [Docker Hub](https://hub.docker.com/r/pagran/traefik)

## [Docker](https://hub.docker.com/r/pagran/traefik)

`docker run -p 80:80 -v $PWD/private-plugins-storage:/private-plugins-storage pagran/traefik:v2.4.0`

## Usage

To activate the private plugin, you must specify `private` in the `version` field and place unpacked plugin into `./private-plugins-storage/src` folder.


For example [plugindemo](https://github.com/traefik/plugindemo):

```yaml
experimental:
  plugins:
    plugindemo:
      moduleName: plugindemo
      version: private
```

```
private-plugins-storage/
└── src
    └── plugindemo
        ├── demo.go
        ├── demo_test.go
        ├── .gitignore
        ├── .golangci.toml
        ├── go.mod
        ├── LICENSE
        ├── Makefile
        ├── readme.md
        └── .traefik.yml
```
