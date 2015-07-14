#!/bin/bash

#!/bin/bash

############################################################
## docker project name
PROJECT_NAME="demo-scp"
############################################################
## docker configurations
DOCKER_USER="saltfactory"
DOCKER_TAG="backupserver"
DOCKER_NAME="demo_scp"
DOCKER_IMAGE="$DOCKER_USER/$DOCKER_NAME:$DOCKER_TAG"
############################################################
## container configurations
DOCKER_CONTAINER_NAME="demo-backupServer"
DOCKER_CONTAINER_PORT="7022"

function is_running {
  docker ps | grep $DOCKER_CONTAINER_NAME
}

function is_exists {
  docker ps -a  | grep $DOCKER_CONTAINER_NAME
}

function build_image {
  docker build -f Dockerfile-backupServer -t $DOCKER_IMAGE .
}


function start_container {
  if [[ -n $(is_running) ]]; then
    echo "*** \"$DOCKER_CONTAINER_NAME\" is running! ***"
     stop_container
     remove_containers
  else
    if [[ -n $(is_exists) ]]; then
      remove_containers
    fi
  fi
  echo "*** [start] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
  docker run --name $DOCKER_CONTAINER_NAME -h backupServer -p $DOCKER_CONTAINER_PORT:22 -it $DOCKER_IMAGE bash
}


function stop_container {
  if [[ -n $(is_running) ]]; then
    echo "*** [stop] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
    docker stop $DOCKER_CONTAINER_NAME

  else
    echo "*** \"$DOCKER_CONTAINER_NAME\" is not running! ***"
  fi
}

function remove_containers {
  stop_container

  if [ -n "$(docker ps -a  | grep $DOCKER_CONTAINER_NAME)" ]; then
    echo "*** [removing] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
    docker rm $(docker ps -a  | grep $DOCKER_CONTAINER_NAME | awk '{print $1}')
  else
    echo "*** \"$DOCKER_CONTAINER_NAME\" is not exist! ***"
  fi
}

function log_containers {
  docker logs $DOCKER_CONTAINER_NAME
}

echo "*** [Run] *** "
if [ -n "$1" ]; then
  case "$1" in
  build)
    build_image 
  ;;
  start)
    start_container
  ;;
  stop)
    stop_container
  ;;
  remove|rm)
    remove_containers
  ;;
  log|logs)
    log_containers
  ;;
  *)
    echo "option is not valid!"
  ;;
  esac
fi

echo "*** [Done] *** "