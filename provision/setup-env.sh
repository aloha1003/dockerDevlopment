#!/bin/bash
#
# append PRIVATE_DOCKER_REGISTRY global env
#


#
cd docker-dev/build-dev
docker-compose up -d

cat <<EOF >> /etc/environment
PRIVATE_DOCKER_REGISTRY="registry.com"
EOF