#!/bin/bash

# 1. Dá permissão para o Docker usar o seu servidor X11 (tela)
xhost +local:docker

# 2. Roda o container espelhando o caminho exato
docker run -it \
    --rm \
    --name simulacao_gate \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$PWD:$PWD" \
    --workdir="$PWD" \
    gate941
