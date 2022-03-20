#!/usr/bin/env bash
zypper packages --unneeded | awk 'NR>4{print $7}' | sudo xargs zypper remove --clean-deps
