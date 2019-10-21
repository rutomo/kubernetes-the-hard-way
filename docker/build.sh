#!/usr/bin/env bash

version=$1

docker build . -t k8s:${version}