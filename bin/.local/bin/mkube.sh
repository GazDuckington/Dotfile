#!/bin/sh
echo 'downloading minikube binary...'
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
echo 'installing minikube binary'
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo 'donezo!'
