#!/bin/bash

cd "$TRILBUILD/builds/muelu_cuda"
#source $TRILINOS/cmake/std/atdm/load-env.sh cee-rhel7-cuda-opt-serial
make install -j 36

