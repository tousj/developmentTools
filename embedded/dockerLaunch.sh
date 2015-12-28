#!/bin/bash
REPO_WORKSPACE=$(realpath $1)

docker run -it \
-e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
-v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v $HOME/.ssh:/home/sqdr/.ssh \
-v /$HOME/.bashrc:/home/sqdr/.bashrc -v $HOME/.gitconfig:/home/sqdr/.gitconfig \
-v $REPO_WORKSPACE:/home/sqdr/workspace \
sqdr:EmbeddedDev
