#!/bin/bash

if [[ -z "${DATASET_DIR}" ]]; then
    echo "Environment variable 'DATASET_DIR' does not exist."
    echo "Please set it in ~/.bashrc using: 'export DATASET_DIR=/path/to/DATASET_DIR'"
    exit 1
fi

COMMAND="/bin/bash"

while test $# -gt 0
do
    case "$1" in
        --run) COMMAND="./run.py"
            ;;
    esac
    shift
done

docker run  --gpus all --rm -ti \
            --volume=$(pwd):/liteflownet:rw \
            -v $DATASET_DIR:/data/frames \
            --workdir=/liteflownet \
            --ipc=host $USER/liteflownet:latest \
            $COMMAND
