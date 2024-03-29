# Hello World REST Service

Simple REST Service that echos some requests back, has `health` and `version` checks. This service runs inside a container so there is almost no overhead in getting started.

---

![](https://img.shields.io/github/commit-activity/m/cloudkats/hello-world-rest)
![](https://img.shields.io/github/last-commit/cloudkats/hello-world-rest)
[![](https://img.shields.io/github/license/ivankatliarchuk/.github)](https://github.com/ivankatliarchuk/.github/LICENCE)
[![](https://img.shields.io/github/languages/code-size/cloudkats/hello-world-rest)](https://github.com/cloudkats/hello-world-rest)
[![](https://img.shields.io/github/repo-size/cloudkats/hello-world-rest)](https://github.com/cloudkats/hello-world-rest)
![](https://img.shields.io/github/languages/top/cloudkats/hello-world-rest?color=green&logo=markdown&logoColor=blue)

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Create](#create)
- [Resources](#resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What is this sevice good for?

- Easy test reverse proxy routes and paths.
- Use this service as a dummy to see if request reach your service correctly.
- Use it to test load balancers by peeking at the out and see the host/ip.
- Use it for Hello World demo projects that require some basic Rest functionality.

### Endpoints

```
/version
/status
/env
/env/:pattern
/echo
/echo/headers
```

## Docker Image

|  Name    | Badges  | Version |
|:---------|:----------|:-----------|
| [Hello World App](./Dockerfile) | [![docker.build-push][gh-action.svg]][gh-action.yml] [![][docker.pulls]][docker.pulls] ![][docker.size] | [![][docker.version]][docker.version] |

## Run

```sh
docker run --rm -it -p 8080:3000 cloudkats/hello-world-rest
curl -i localhost:8080/env
```

## Docker Compose

Run compose `make run`.

Dashboard `http://localhost:8080/dashboard`

Example runs

```sh
curl -s localhost:8080/api/rawdata | jq .
curl -H 'Host:whoami.docker.localhost' 'http://localhost/'
curl -i localhost:3000/echo/12345
curl -i localhost:3000/version
curl -i localhost:3000/status
curl -i localhost:3000/env
curl -i localhost:3000/env/rvm_
```

---

## Create

[**Create a repository using this template →**][template.generate]

<!-- resources -->
[template.generate]: https://github.com/cloudkats/hello-world-rest/generate
[code-style.badge]: https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square

[gh-action.svg]: https://github.com/cloudkats/hello-world-rest/actions/workflows/docker.build-push.yaml/badge.svg
[gh-action.yml]: https://github.com/cloudkats/hello-world-rest/actions/workflows/docker.build-push.yaml
[docker.pulls]: https://img.shields.io/docker/pulls/cloudkats/hello-world-rest?color=green&logo=docker&logoColor=#aae5ed&style=flat-square
[docker.size]: https://img.shields.io/docker/image-size/cloudkats/hello-world-rest
[docker.version]: https://img.shields.io/docker/v/cloudkats/hello-world-rest?color=green&logo=docker&logoColor=#aae5ed&style=flat-square
