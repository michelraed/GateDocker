#!/bin/bash

# 1. Dá permissão para o Docker usar o seu servidor X11
xhost +local:docker

# 2. Roda o container
docker run -it \
    --rm \
    --name simulacao_gate \
    --user "$(id -u):$(id -g)" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="HOME=/tmp" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$PWD:$PWD" \
    --workdir="$PWD" \
    gate92
