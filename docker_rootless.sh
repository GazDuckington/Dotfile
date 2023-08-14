#!/bin/sh

if [[ $(id -u) -ne 0 ]]; then
  echo "Please, run as root."
  exit 1
fi

systemctl --user stop docker
rm -f ~/bin/dockerd
curl -fsSL https://get.docker.com/rootless | sh
