#!/bin/sh

echo "install docker rootless"
systemctl --user stop docker
rm -f ~/bin/dockerd
curl -fsSL https://get.docker.com/rootless | sh

echo "install compose plugin"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p "$DOCKER_CONFIG"/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o "$DOCKER_CONFIG"/cli-plugins/docker-compose