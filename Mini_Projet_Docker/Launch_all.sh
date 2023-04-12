#!/bin/bash

# Build the Ansible image
docker-compose build

# Run the Docker containers and start the Ansible playbook
docker-compose up -d
docker exec -it ansible ansible-playbook create_users.yml
