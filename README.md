# jq
- [Overview](#Overview)
- [Quick Links](#Quick-Links)
- [Prerequisites](#Prerequisites)
- [FAQs](#FAQs)

## Overview
Yet another jq Docker image ...  Check the [FAQs](#FAQs) for why.

## Quick Links
- [jq](https://stedolan.github.io/jq/)
- [jq - Alpine Linux packages](https://pkgs.alpinelinux.org/package/edge/main/x86/jq)

## Prerequisites
- [GNU make](https://www.gnu.org/software/make/manual/make.html>)

## Getting Started
### Help
There should be a `make`` target to be able to get most things done.  Check the help for more information:
```
make help
```
### Building the Local Environment
Get the code and change into the top level `git` project directory:
```
git clone git@github.com:loum/jq.git && cd jq
```
Run all commands from the top-level directory of the ``git`` repository.
For first-time setup, get the [Makester project](https://github.com/loum/makester.git):
```
git submodule update --init
```
Initialise the environment:
```
make init
```
#### Local Environment Maintenance
Keep [Makester project](https://github.com/loum/makester.git) up-to-date with:
```
git submodule update --remote --merge
```
### Building the Docker Image
```
make build-image
```
### Searching `jq` Docker Images
To list the available ``jq`` Docker images::
```
make search-image
```
### Docker Image Version Tag
Tagging convention used is:
```
alpine<ALPINE_DOCKER_VERSION>-<JQ_VERSION>
```
`latest` tag is created with:
```
make tag-latest
```
## Useful Commands
### `make run`
Will create a `jq` container from the new image build.

## FAQs
***Q. Why another jq Docker image?***
- Security
  - Working for an organisation that take Security to the next level, I've created this simple [jq](https://stedolan.github.io/jq/) client based off the most recent Alpine.  My adjustments include:
  - latest [Alpine Docker image](https://hub.docker.com/_/alpine) to stay a step ahead of [CVEs[(https://cve.mitre.org/)
  - create a dedicated `jq` user with UID `30999` to get around our Kubernetes cluster policy constraints
- Portability 
  -  if you create products that support a broad developer user base across various development environments and just want stuff to work?  Then containerise it and be done with it
