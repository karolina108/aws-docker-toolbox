## List Docker CLI commands
docker
docker container --help

## Docker info
docker --version # Display Docker version
docker version # Display Docker version
docker info # Display more Docker information

## Images
docker image ls
docker image rm <image_id> # Remove all images with a given id
docker image rm $(docker image ls -a -q) # Remove all images

docker build -t app-name-env:latest . # Build image Dockerfile's directory & tag it

## Execute Docker image
docker run hello-world
docker run -p 4444:80 app-name-env:latest # Run with mappling port 4444 (on host) to 80 (port exposed)
docker run -d -p 4444:80 app-name-env:latest # Run with detached mode (closing terminal will not stop the container)

## Containers
docker container ls # List all running containers
docker container ls --all # List all containers, even those that are not running
docker container ls -aq # List all containers, in quiet mode

docker container stop <hash> # Stop the running container
docker container kill <hash> # Force shutdown of the specified container
docker container rm $(docker container ls -a -q) # Remove all containers

## Registry
docker tag app-name-env:latest username/app-name-env:latest # Tag image before pushing it to registry
docker push username/app-name-env:latest # Push image to registry
docker pull username/app-name-env:latest # Pull image from registry
docker run username/app-name-env:latest # Run image from registry