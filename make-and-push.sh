#!/bin/bash
set -e

cd ./traefik-src

docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_TOKEN}

TAG=${GIT_REF}

if [[ ${TAG} = "master" ]]; then
    TAG="latest"
fi

REPO=${DOCKER_HUB_REPO}:${TAG}
make build-image REPO=${REPO}
docker push ${REPO}
