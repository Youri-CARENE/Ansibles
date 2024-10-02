#!/bin/bash

docker run -d --name ubuntu1 ubuntu
docker run -d --name ubuntu2 ubuntu
docker run -d --name ubuntu3 ubuntu
docker run -d --name ubuntu4 ubuntu

docker exec -it ubuntu1 ansible-galaxy collection install community.general
docker exec -it ubuntu2 ansible-galaxy collection install community.general
docker exec -it ubuntu3 ansible-galaxy collection install community.general
docker exec -it ubuntu4 ansible-galaxy collection install community.general

docker exec -it ubuntu1 ansible-playbook create_users.yml
