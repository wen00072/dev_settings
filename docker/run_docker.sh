#!/bin/bash
HAS_RUN=$(docker ps | grep dev | awk '{print $12}')
if [ -z "${HAS_RUN}" ] ; then
    HAS_CONTAINER=$(docker container ls -a | grep dev)
    if [ -n "${HAS_CONTAINER}" ] ; then
        docker container start dev
    else
        mkdir -p ${HOME}/work
        # For gdb: https://stackoverflow.com/questions/35860527/warning-error-disabling-address-space-randomization-operation-not-permitted
        docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged -v ${HOME}/work:/home/user/work -d -P --name dev udev
        docker port dev 22
    fi
fi
