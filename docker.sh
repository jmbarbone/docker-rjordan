#!/bin/env bash

dir=${1:-.}
docker build --tag rjordan $dir && \
    docker tag rjordan jmbarbone/rjordan && \
    docker push jmbarbone/rjordan
