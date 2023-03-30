#!/bin/bash

# Build the Docker image from the Dockerfile
docker build -t my-ubuntu-image .

# Launch three Docker containers from the image
for i in {1..3}
do
  docker run -d my-ubuntu-image
done
