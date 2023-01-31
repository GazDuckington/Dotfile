#!/bin/sh

sync_version() {
	echo 'downloading minikube binary...' &&
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
	echo 'installing minikube binary' &&
	sudo install minikube-linux-amd64 /usr/local/bin/minikube &&
	echo 'donezo!'
}

remove_minikube() {
	echo 'removing binary' &&
	sudo rm /usr/local/bin/minikube &&
	echo 'donezo!'
}

main() {
	case "$1" in
		"(install|update)")
			sync_version
		;;
		"(remove|uninstall)")
			remove_minikube
		;;
		*)
			sync_version
		;;
	esac
}

main "$1"
