#!/bin/bash -v

function rundockerx ()
{
    sudo docker run -it --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx/ compute-artifactory.amd.com:5000/rocm-plus-docker/compute-rocm-dkms-no-npi-hipclang:$1
}

function link_rocm ()
{
    sudo ln -s rocm-* /opt/rocm
}
